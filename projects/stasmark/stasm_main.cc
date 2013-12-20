/* 
 * File:   main.cc
 * Author: mchaberski
 *
 * Created on December 20, 2013, 10:15 AM
 */

#include <cstdlib>
#include <cstdio>
#include <stasm_lib.h>
#include <stasm_lib_ext.h>
#include <stasm_constants.h>
#include <iostream> 
#include <string>
#include <getopt.h>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "stasm_main.h"
using namespace std;
using namespace stasm;

void print_landmarks(int face_index, float* landmarks, ostream& out, const string& delim, bool print_index)
{
    for (int i = 0; i < stasm_NLANDMARKS; i++) {
        float x = landmarks[i * 2], y = landmarks[i * 2 + 1];
        if (print_index) {
            out << face_index << delim;
        }
        out << x << delim << y << endl;
    }
}

static bool detect_landmarks(bool multi, int minwidth, const char* image_pathname, ostream& out, int* num_faces)
{
    const cv::Mat_<unsigned char> img(cv::imread(image_pathname, CV_LOAD_IMAGE_GRAYSCALE));
    if (!img.data) {// could not load image?
        cerr << "failed to load image from path " <<  image_pathname << endl;
        return false;
    }
    StasmData stasm_data;
    const int trace = 0;
    if (stasm_init(stasm_data, StasmUtils::GetModelsDataDir()) != StasmResult::SUCCESS) {
        cerr << "stasm_init failed: " << stasm_lasterr() << endl;
        return false;
    }
    if (stasm_open_image(stasm_data, (const char*)img.data, img.cols, img.rows, image_pathname, multi, minwidth) != StasmResult::SUCCESS) {
        cerr << "stasm_open_image failed: " << stasm_lasterr() << endl;
    }
    // Test stasm_search_auto.
    // The min face size was set in the above stasm_open_image call.

    float landmarks[2 * stasm_NLANDMARKS]; // x,y coords
    *num_faces = 0;
    while (true) {
//        cerr << "--- Auto Face " << num_faces << endl;
        int foundface;
        float estyaw;
        if (!stasm_search_auto_ext(stasm_data, &foundface, landmarks, &estyaw)) {
            cerr << "stasm_search_auto_ext failed: " << stasm_lasterr() << endl;
            return false;
        }
        print_landmarks(*num_faces + 1, landmarks, out, "\t", multi);
        if (!foundface) {
            break;
        }
        (*num_faces)++;
//        cerr << "Final with auto init; yaw = " << estyaw << endl;
        if (!multi) {
            break;
        }
    }
    return true;
}

const int ERR_USAGE = 1, ERR_STASM = 2, ERR_NO_FACES = 3;

void print_usage(ostream& out)
{
    out << 
"Print face landmarks detected by STASM." << endl << 
"Usage:" << endl << 
"    stasmark [-w MINWIDTH] [-s] FILE" << endl << 
"where FILE is an image pathname." << endl << 
"" << endl << 
"Options:" << endl << 
"    -w MINWIDTH     set minimum width as a percentage of image width" << endl << 
"                    (MINWIDTH must be an integer in range [1,100])" << endl << 
"    -s              stop after detecting first face" << endl << 
"" << endl << 
"Exit codes:" << endl << 
"    0    success" << endl << 
"    1    usage error" << endl << 
"    2    STASM error" << endl << 
"    3    no faces detected" << endl; 
}

int parse_args(int argc, char** argv, int* min_width, bool* multi, int* first_positional_index, bool* help)
{
       int c;
       *multi = true;
       *min_width = 25;
       opterr = 0;
       *help = false;
       while ((c = getopt (argc, argv, "w:sh")) != -1)
         switch (c)
           {
             case 'h':
                 *help = true;
                 return EXIT_SUCCESS;
           case 's':
             *multi = false;
             break;
           case 'w': {
             const char* min_width_str = optarg;
             int num_valid = sscanf(min_width_str, "%d", min_width);
             if ((num_valid != 1)) {
                 cerr << "stasmark: invalid argument: min width = " << min_width_str << endl;
                 return ERR_USAGE;
             }
             if ((*min_width < 1) || (*min_width > 100)) {
                 cerr << "stasmark: minimum width must be integer in range [1, 100], not " << min_width << endl;
                 return ERR_USAGE;
             }
             break;
           } case '?':
             if (optopt == 'w')
               cerr << "stasmark: Option -w requires an argument." << endl;
             else
               cerr << "stasmark: Unknown option character" << endl;
             return ERR_USAGE;
           default:
               cerr << "stasmark: unhandled usage error" << endl;
               return ERR_USAGE;
           }
     
       *first_positional_index = optind;
       if (argc != (optind + 1)) {
           cerr << "stasmark: must specify exactly one image pathname argument" << endl;
           return ERR_USAGE;
       }
       return EXIT_SUCCESS;
}

int stasm_main(int argc, char** argv, ostream& out)
{
    bool help = false, multi = true;
    int min_width = 25, first_positional_index = -1;
    int parse_result = parse_args(argc, argv, &min_width, &multi, &first_positional_index, &help);
    if (parse_result == ERR_USAGE) {
        print_usage(cerr);
        return ERR_USAGE;
    }
    if (help) {
        print_usage(out);
        return EXIT_SUCCESS;
    }
    int num_faces = 0;
    bool ok = detect_landmarks(multi, min_width, argv[first_positional_index], out, &num_faces);
    if (!ok) {
        return ERR_STASM;
    }
    return num_faces == 0 ? ERR_NO_FACES : EXIT_SUCCESS;
}

/*
 * 
 */
int main(int argc, char** argv) {
    return stasm_main(argc, argv, cout);
}

