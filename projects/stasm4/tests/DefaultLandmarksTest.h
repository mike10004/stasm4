/*
 * File:   DefaultLandmarksTest.h
 * Author: mchaberski
 *
 * Created on Dec 19, 2013, 10:53:06 AM
 */

#ifndef DEFAULTLANDMARKSTEST_H
#define	DEFAULTLANDMARKSTEST_H

#include <cppunit/extensions/HelperMacros.h>

class DefaultLandmarksTest : public CPPUNIT_NS::TestFixture {
    CPPUNIT_TEST_SUITE(DefaultLandmarksTest);

    CPPUNIT_TEST(testMethod);
    CPPUNIT_TEST(testFailedMethod);

    CPPUNIT_TEST_SUITE_END();

public:
    DefaultLandmarksTest();
    virtual ~DefaultLandmarksTest();
    void setUp();
    void tearDown();

private:
    void testMethod();
    void testFailedMethod();
};

#endif	/* DEFAULTLANDMARKSTEST_H */

