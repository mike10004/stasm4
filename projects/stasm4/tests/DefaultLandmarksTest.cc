/*
 * File:   DefaultLandmarksTest.cc
 * Author: mchaberski
 *
 * Created on Dec 19, 2013, 10:53:06 AM
 */

#include "../../../stasm/stasm.h"
#include "DefaultLandmarksTest.h"
#include <vector>
#include <fstream>
#include <iostream>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/core/core.hpp>
#include "../../../stasm/misc.h"

using namespace std;
using namespace stasm;

CPPUNIT_TEST_SUITE_REGISTRATION(DefaultLandmarksTest);

    // round a floating point number to the nearest integer
    template <typename Arg>
    int Round(Arg r)
    {
        return (r > (Arg) 0.0) ? (int)(r + (Arg) 0.5) : (int)(r - (Arg) 0.5);
    }

DefaultLandmarksTest::DefaultLandmarksTest() {
}

DefaultLandmarksTest::~DefaultLandmarksTest() {
}

void DefaultLandmarksTest::setUp() {
}

void DefaultLandmarksTest::tearDown() {
}

static bool populate_landmarks(vector<int>& x_dst, vector<int>& y_dst, float* landmarks_src)
{
    for (int i = 0; i < stasm_NLANDMARKS; i++) {
        float xf = landmarks_src[i*2];
        float yf = landmarks_src[i*2+1];
        int x = Round(xf), y = Round(yf);
        x_dst.push_back(x);
        y_dst.push_back(y);
    }
    cerr << "populated " << x_dst.size() << " landmarks from float array" << endl;
}

static bool detect_landmarks(bool multi, int minwidth, const char* image_pathname, vector<int>& xs, vector<int>& ys)
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
    int num_faces = 0;
    while (true) {
        cerr << "--- Auto Face " << num_faces << endl;
        int foundface;
        float estyaw;
        if (!stasm_search_auto_ext(stasm_data, &foundface, landmarks, &estyaw)) {
            cerr << "stasm_search_auto_ext failed: " << stasm_lasterr() << endl;
            return false;
        }
        populate_landmarks(xs, ys, landmarks);
        if (!foundface) {
            cerr << "No more faces" << endl;
            break; // note break
        }
        num_faces++;
        cerr << "Final with auto init; yaw = " << estyaw << endl;
        if (!multi) {
            break;
        }
    }
    return true;
}

static bool are_equal(vector<int>& a, vector<int>& b)
{
    if (a.size() != b.size()) {
        cerr << "vectors incongruent: " << a.size() << " != " << b.size() << endl;
        return false;
    }
    for (size_t i = 0; i < a.size(); i++) {
        if (a[i] != b[i]) {
            cerr << "vectors not equal at index " << i << endl;
            return false;
        }
    }
    return true;
}

void DefaultLandmarksTest::testMethod() {
    const char* expected_landmarks_pathname = "../../tests/data/test_stasm_lib_testface_output.txt";
    vector<int> expected_xs;
    vector<int> expected_ys;
    ifstream infile(expected_landmarks_pathname);
    CPPUNIT_ASSERT(infile.is_open());
    int x, y;
    while (infile >> x >> y) {
        expected_xs.push_back(x);
        expected_ys.push_back(y);
    }
    for (size_t i = 0; i < expected_xs.size(); i++) {
        cerr << "x = " << expected_xs[i] << " y = " << expected_ys[i] << endl;
    }
    cerr << "finished reading " << expected_landmarks_pathname << endl;
    
    vector<int> actual_xs;
    vector<int> actual_ys;
    const char* image_pathname = "../../tests/data/testface.jpg";
    bool ok = detect_landmarks(false, 10, image_pathname, actual_xs, actual_ys);
    CPPUNIT_ASSERT(ok);
    for (size_t i = 0; i < actual_xs.size(); i++) {
        cerr << "x = " << actual_xs[i] << " y = " << actual_ys[i] << endl;
    }
    CPPUNIT_ASSERT(are_equal(expected_xs, actual_xs));
    CPPUNIT_ASSERT(are_equal(expected_ys, actual_ys));
}

void DefaultLandmarksTest::testFailedMethod() {
//    CPPUNIT_ASSERT(false);
}

