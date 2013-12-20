/*
 * File:   MainTest.h
 * Author: mchaberski
 *
 * Created on Dec 20, 2013, 12:16:27 PM
 */

#ifndef MAINTEST_H
#define	MAINTEST_H

#include <cppunit/extensions/HelperMacros.h>

class MainTest : public CPPUNIT_NS::TestFixture {
    CPPUNIT_TEST_SUITE(MainTest);

    CPPUNIT_TEST(testHelp);
    CPPUNIT_TEST(testBadMinWidthArg1);
    CPPUNIT_TEST(testBadMinWidthArg2);
    CPPUNIT_TEST(testUnrecognizedOption);
    CPPUNIT_TEST(testNormal_MultiFaceImage_MultiFaceDetection);
    CPPUNIT_TEST(testNoFaces);

    CPPUNIT_TEST_SUITE_END();

public:
    MainTest();
    virtual ~MainTest();
    void setUp();
    void tearDown();

private:
    void testHelp();
    void testBadMinWidthArg1();
    void testBadMinWidthArg2();
    void testUnrecognizedOption();
    void testNoFaces();
    void testNormal_SingleFaceImage_MultiFaceDetection();
    void testNormal_SingleFaceImage_SingleFaceDetection();
    void testNormal_MultiFaceImage_SingleFaceDetection();
    void testNormal_MultiFaceImage_MultiFaceDetection()    ;
};

#endif	/* MAINTEST_H */

