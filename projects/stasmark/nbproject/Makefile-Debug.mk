#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux-x86
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/stasm_main.o

# Test Directory
TESTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}/tests

# Test Files
TESTFILES= \
	${TESTDIR}/TestFiles/f1

# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-Wl,-rpath,../stasm4/dist/Debug/GNU-Linux-x86 -L../stasm4/dist/Debug/GNU-Linux-x86 -lstasm4 -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_objdetect

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/stasmark

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/stasmark: ../stasm4/dist/Debug/GNU-Linux-x86/libstasm4.so

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/stasmark: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/stasmark ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/stasm_main.o: stasm_main.cc 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -I../../stasm -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/stasm_main.o stasm_main.cc

# Subprojects
.build-subprojects:
	cd ../stasm4 && ${MAKE}  -f Makefile CONF=Debug

# Build Test Targets
.build-tests-conf: .build-conf ${TESTFILES}
${TESTDIR}/TestFiles/f1: ${TESTDIR}/tests/MainTest.o ${TESTDIR}/tests/main_test_runner.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f1 $^ ${LDLIBSOPTIONS} `cppunit-config --libs`   


${TESTDIR}/tests/MainTest.o: tests/MainTest.cc 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -I../../stasm `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/MainTest.o tests/MainTest.cc


${TESTDIR}/tests/main_test_runner.o: tests/main_test_runner.cc 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -I../../stasm `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/main_test_runner.o tests/main_test_runner.cc


${OBJECTDIR}/stasm_main_nomain.o: ${OBJECTDIR}/stasm_main.o stasm_main.cc 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/stasm_main.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -I../../stasm -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/stasm_main_nomain.o stasm_main.cc;\
	else  \
	    ${CP} ${OBJECTDIR}/stasm_main.o ${OBJECTDIR}/stasm_main_nomain.o;\
	fi

# Run Test Targets
.test-conf:
	@if [ "${TEST}" = "" ]; \
	then  \
	    ${TESTDIR}/TestFiles/f1 || true; \
	else  \
	    ./${TEST} || true; \
	fi

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/stasmark

# Subprojects
.clean-subprojects:
	cd ../stasm4 && ${MAKE}  -f Makefile CONF=Debug clean

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
