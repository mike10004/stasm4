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
	${OBJECTDIR}/_ext/1480797537/facedet.o \
	${OBJECTDIR}/_ext/1480797537/initasm.o \
	${OBJECTDIR}/_ext/1634603738/asm.o \
	${OBJECTDIR}/_ext/1634603738/classicdesc.o \
	${OBJECTDIR}/_ext/1634603738/convshape.o \
	${OBJECTDIR}/_ext/1634603738/err.o \
	${OBJECTDIR}/_ext/1634603738/eyedet.o \
	${OBJECTDIR}/_ext/1634603738/eyedist.o \
	${OBJECTDIR}/_ext/1634603738/faceroi.o \
	${OBJECTDIR}/_ext/1634603738/hat.o \
	${OBJECTDIR}/_ext/1634603738/hatdesc.o \
	${OBJECTDIR}/_ext/1634603738/landmarks.o \
	${OBJECTDIR}/_ext/1634603738/misc.o \
	${OBJECTDIR}/_ext/1634603738/pinstart.o \
	${OBJECTDIR}/_ext/1634603738/print.o \
	${OBJECTDIR}/_ext/1634603738/shape17.o \
	${OBJECTDIR}/_ext/1634603738/shapehacks.o \
	${OBJECTDIR}/_ext/1634603738/shapemod.o \
	${OBJECTDIR}/_ext/1634603738/startshape.o \
	${OBJECTDIR}/_ext/1634603738/stasm.o \
	${OBJECTDIR}/_ext/1634603738/stasm_lib.o

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
LDLIBSOPTIONS=-lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_objdetect

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libstasm4.${CND_DLIB_EXT}

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libstasm4.${CND_DLIB_EXT}: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libstasm4.${CND_DLIB_EXT} ${OBJECTFILES} ${LDLIBSOPTIONS} -Wl,-soname,libstasm4.so -shared -fPIC

${OBJECTDIR}/_ext/1480797537/facedet.o: ../../stasm/MOD_1/facedet.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1480797537
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1480797537/facedet.o ../../stasm/MOD_1/facedet.cpp

${OBJECTDIR}/_ext/1480797537/initasm.o: ../../stasm/MOD_1/initasm.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1480797537
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1480797537/initasm.o ../../stasm/MOD_1/initasm.cpp

${OBJECTDIR}/_ext/1634603738/asm.o: ../../stasm/asm.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/asm.o ../../stasm/asm.cpp

${OBJECTDIR}/_ext/1634603738/classicdesc.o: ../../stasm/classicdesc.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/classicdesc.o ../../stasm/classicdesc.cpp

${OBJECTDIR}/_ext/1634603738/convshape.o: ../../stasm/convshape.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/convshape.o ../../stasm/convshape.cpp

${OBJECTDIR}/_ext/1634603738/err.o: ../../stasm/err.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/err.o ../../stasm/err.cpp

${OBJECTDIR}/_ext/1634603738/eyedet.o: ../../stasm/eyedet.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/eyedet.o ../../stasm/eyedet.cpp

${OBJECTDIR}/_ext/1634603738/eyedist.o: ../../stasm/eyedist.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/eyedist.o ../../stasm/eyedist.cpp

${OBJECTDIR}/_ext/1634603738/faceroi.o: ../../stasm/faceroi.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/faceroi.o ../../stasm/faceroi.cpp

${OBJECTDIR}/_ext/1634603738/hat.o: ../../stasm/hat.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/hat.o ../../stasm/hat.cpp

${OBJECTDIR}/_ext/1634603738/hatdesc.o: ../../stasm/hatdesc.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/hatdesc.o ../../stasm/hatdesc.cpp

${OBJECTDIR}/_ext/1634603738/landmarks.o: ../../stasm/landmarks.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/landmarks.o ../../stasm/landmarks.cpp

${OBJECTDIR}/_ext/1634603738/misc.o: ../../stasm/misc.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/misc.o ../../stasm/misc.cpp

${OBJECTDIR}/_ext/1634603738/pinstart.o: ../../stasm/pinstart.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/pinstart.o ../../stasm/pinstart.cpp

${OBJECTDIR}/_ext/1634603738/print.o: ../../stasm/print.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/print.o ../../stasm/print.cpp

${OBJECTDIR}/_ext/1634603738/shape17.o: ../../stasm/shape17.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/shape17.o ../../stasm/shape17.cpp

${OBJECTDIR}/_ext/1634603738/shapehacks.o: ../../stasm/shapehacks.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/shapehacks.o ../../stasm/shapehacks.cpp

${OBJECTDIR}/_ext/1634603738/shapemod.o: ../../stasm/shapemod.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/shapemod.o ../../stasm/shapemod.cpp

${OBJECTDIR}/_ext/1634603738/startshape.o: ../../stasm/startshape.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/startshape.o ../../stasm/startshape.cpp

${OBJECTDIR}/_ext/1634603738/stasm.o: ../../stasm/stasm.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/stasm.o ../../stasm/stasm.cpp

${OBJECTDIR}/_ext/1634603738/stasm_lib.o: ../../stasm/stasm_lib.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	${RM} "$@.d"
	$(COMPILE.cc) -g -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/stasm_lib.o ../../stasm/stasm_lib.cpp

# Subprojects
.build-subprojects:

# Build Test Targets
.build-tests-conf: .build-conf ${TESTFILES}
${TESTDIR}/TestFiles/f1: ${TESTDIR}/tests/DefaultLandmarksTest.o ${TESTDIR}/tests/landmarks_default_test_runner.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f1 $^ ${LDLIBSOPTIONS} `cppunit-config --libs`   


${TESTDIR}/tests/DefaultLandmarksTest.o: tests/DefaultLandmarksTest.cc 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/DefaultLandmarksTest.o tests/DefaultLandmarksTest.cc


${TESTDIR}/tests/landmarks_default_test_runner.o: tests/landmarks_default_test_runner.cc 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/landmarks_default_test_runner.o tests/landmarks_default_test_runner.cc


${OBJECTDIR}/_ext/1480797537/facedet_nomain.o: ${OBJECTDIR}/_ext/1480797537/facedet.o ../../stasm/MOD_1/facedet.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1480797537
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1480797537/facedet.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1480797537/facedet_nomain.o ../../stasm/MOD_1/facedet.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1480797537/facedet.o ${OBJECTDIR}/_ext/1480797537/facedet_nomain.o;\
	fi

${OBJECTDIR}/_ext/1480797537/initasm_nomain.o: ${OBJECTDIR}/_ext/1480797537/initasm.o ../../stasm/MOD_1/initasm.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1480797537
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1480797537/initasm.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1480797537/initasm_nomain.o ../../stasm/MOD_1/initasm.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1480797537/initasm.o ${OBJECTDIR}/_ext/1480797537/initasm_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/asm_nomain.o: ${OBJECTDIR}/_ext/1634603738/asm.o ../../stasm/asm.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/asm.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/asm_nomain.o ../../stasm/asm.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/asm.o ${OBJECTDIR}/_ext/1634603738/asm_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/classicdesc_nomain.o: ${OBJECTDIR}/_ext/1634603738/classicdesc.o ../../stasm/classicdesc.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/classicdesc.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/classicdesc_nomain.o ../../stasm/classicdesc.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/classicdesc.o ${OBJECTDIR}/_ext/1634603738/classicdesc_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/convshape_nomain.o: ${OBJECTDIR}/_ext/1634603738/convshape.o ../../stasm/convshape.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/convshape.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/convshape_nomain.o ../../stasm/convshape.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/convshape.o ${OBJECTDIR}/_ext/1634603738/convshape_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/err_nomain.o: ${OBJECTDIR}/_ext/1634603738/err.o ../../stasm/err.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/err.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/err_nomain.o ../../stasm/err.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/err.o ${OBJECTDIR}/_ext/1634603738/err_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/eyedet_nomain.o: ${OBJECTDIR}/_ext/1634603738/eyedet.o ../../stasm/eyedet.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/eyedet.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/eyedet_nomain.o ../../stasm/eyedet.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/eyedet.o ${OBJECTDIR}/_ext/1634603738/eyedet_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/eyedist_nomain.o: ${OBJECTDIR}/_ext/1634603738/eyedist.o ../../stasm/eyedist.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/eyedist.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/eyedist_nomain.o ../../stasm/eyedist.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/eyedist.o ${OBJECTDIR}/_ext/1634603738/eyedist_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/faceroi_nomain.o: ${OBJECTDIR}/_ext/1634603738/faceroi.o ../../stasm/faceroi.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/faceroi.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/faceroi_nomain.o ../../stasm/faceroi.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/faceroi.o ${OBJECTDIR}/_ext/1634603738/faceroi_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/hat_nomain.o: ${OBJECTDIR}/_ext/1634603738/hat.o ../../stasm/hat.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/hat.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/hat_nomain.o ../../stasm/hat.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/hat.o ${OBJECTDIR}/_ext/1634603738/hat_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/hatdesc_nomain.o: ${OBJECTDIR}/_ext/1634603738/hatdesc.o ../../stasm/hatdesc.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/hatdesc.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/hatdesc_nomain.o ../../stasm/hatdesc.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/hatdesc.o ${OBJECTDIR}/_ext/1634603738/hatdesc_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/landmarks_nomain.o: ${OBJECTDIR}/_ext/1634603738/landmarks.o ../../stasm/landmarks.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/landmarks.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/landmarks_nomain.o ../../stasm/landmarks.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/landmarks.o ${OBJECTDIR}/_ext/1634603738/landmarks_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/misc_nomain.o: ${OBJECTDIR}/_ext/1634603738/misc.o ../../stasm/misc.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/misc.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/misc_nomain.o ../../stasm/misc.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/misc.o ${OBJECTDIR}/_ext/1634603738/misc_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/pinstart_nomain.o: ${OBJECTDIR}/_ext/1634603738/pinstart.o ../../stasm/pinstart.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/pinstart.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/pinstart_nomain.o ../../stasm/pinstart.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/pinstart.o ${OBJECTDIR}/_ext/1634603738/pinstart_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/print_nomain.o: ${OBJECTDIR}/_ext/1634603738/print.o ../../stasm/print.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/print.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/print_nomain.o ../../stasm/print.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/print.o ${OBJECTDIR}/_ext/1634603738/print_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/shape17_nomain.o: ${OBJECTDIR}/_ext/1634603738/shape17.o ../../stasm/shape17.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/shape17.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/shape17_nomain.o ../../stasm/shape17.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/shape17.o ${OBJECTDIR}/_ext/1634603738/shape17_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/shapehacks_nomain.o: ${OBJECTDIR}/_ext/1634603738/shapehacks.o ../../stasm/shapehacks.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/shapehacks.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/shapehacks_nomain.o ../../stasm/shapehacks.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/shapehacks.o ${OBJECTDIR}/_ext/1634603738/shapehacks_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/shapemod_nomain.o: ${OBJECTDIR}/_ext/1634603738/shapemod.o ../../stasm/shapemod.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/shapemod.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/shapemod_nomain.o ../../stasm/shapemod.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/shapemod.o ${OBJECTDIR}/_ext/1634603738/shapemod_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/startshape_nomain.o: ${OBJECTDIR}/_ext/1634603738/startshape.o ../../stasm/startshape.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/startshape.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/startshape_nomain.o ../../stasm/startshape.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/startshape.o ${OBJECTDIR}/_ext/1634603738/startshape_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/stasm_nomain.o: ${OBJECTDIR}/_ext/1634603738/stasm.o ../../stasm/stasm.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/stasm.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/stasm_nomain.o ../../stasm/stasm.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/stasm.o ${OBJECTDIR}/_ext/1634603738/stasm_nomain.o;\
	fi

${OBJECTDIR}/_ext/1634603738/stasm_lib_nomain.o: ${OBJECTDIR}/_ext/1634603738/stasm_lib.o ../../stasm/stasm_lib.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1634603738
	@NMOUTPUT=`${NM} ${OBJECTDIR}/_ext/1634603738/stasm_lib.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -fPIC  -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1634603738/stasm_lib_nomain.o ../../stasm/stasm_lib.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/_ext/1634603738/stasm_lib.o ${OBJECTDIR}/_ext/1634603738/stasm_lib_nomain.o;\
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
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libstasm4.${CND_DLIB_EXT}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
