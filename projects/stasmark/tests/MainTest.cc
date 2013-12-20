/*
 * File:   MainTest.cc
 * Author: mchaberski
 *
 * Created on Dec 20, 2013, 12:16:27 PM
 */

#include <cstdlib>
#include <iostream>

#include "MainTest.h"

#include "../stasm_main.h"

using namespace std;
 


CPPUNIT_TEST_SUITE_REGISTRATION(MainTest);

MainTest::MainTest() {
}

MainTest::~MainTest() {
}

void MainTest::setUp() {
}

void MainTest::tearDown() {
}

void MainTest::testHelp() 
{ 
    CPPUNIT_ASSERT(true); 
}

void MainTest::testBadMinWidthArg1() 
{ 
    CPPUNIT_ASSERT(true); 
}

void MainTest::testBadMinWidthArg2()
{ 
    CPPUNIT_ASSERT(true); 
}

void MainTest::testUnrecognizedOption()
{ 
    CPPUNIT_ASSERT(true);
}

void MainTest::testNormal_SingleFaceImage_MultiFaceDetection()
{ 
    const char* image_pathname = "../../tests/data/testface.jpg";
    char* argv[] = {
        (char*) "stasmark",
        (char*) image_pathname
    };
    int argc = 2;
    int exit_code = stasm_main(argc, argv, cerr);
    CPPUNIT_ASSERT(exit_code == EXIT_SUCCESS);
}

void MainTest::testNormal_SingleFaceImage_SingleFaceDetection()
{ 
    const char* image_pathname = "../../tests/data/testface.jpg";
    char* argv[] = {
        (char*) "stasmark",
        (char*) "-s",
        (char*) image_pathname
    };
    int argc = 3;
    int exit_code = stasm_main(argc, argv, cerr);
    CPPUNIT_ASSERT(exit_code == EXIT_SUCCESS);
}


void MainTest::testNormal_MultiFaceImage_SingleFaceDetection()
{ 
    const char* image_pathname = "../../tests/data/bush_rumsfeld_cropped.jpg";
    char* argv[] = {
        (char*) "stasmark",
        (char*) "-s",
        (char*) image_pathname
    };
    int argc = 3;
    int exit_code = stasm_main(argc, argv, cerr);
    CPPUNIT_ASSERT(exit_code == EXIT_SUCCESS);
}

void MainTest::testNormal_MultiFaceImage_MultiFaceDetection()
{ 
    const char* image_pathname = "../../tests/data/bush_rumsfeld_cropped.jpg";
    char* argv[] = {
        (char*) "stasmark",
        (char*) image_pathname
    };
    int argc = 2;
    int exit_code = stasm_main(argc, argv, cerr);
    CPPUNIT_ASSERT(exit_code == EXIT_SUCCESS);
}

void MainTest::testNoFaces()  { 
    CPPUNIT_ASSERT(true); 
}
