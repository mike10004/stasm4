// stasm_lib.cpp: interface to the Stasm library
//
// Copyright (C) 2005-2013, Stephen Milborrow

#include "stasm.h"
#include "stasm_lib.h"

using namespace stasm;

const char* const stasm_VERSION = STASM_VERSION;


//-----------------------------------------------------------------------------

namespace stasm
{
    
    const char* StasmUtils::GetModelsDataDir()
    {
#ifndef _WIN32
#ifndef SHARE_DIR_PARENT
#define SHARE_DIR_PARENT "/usr"
#endif
#ifndef OPENCV_HAARCASCADES_DIR
#define OPENCV_HAARCASCADES_DIR SHARE_DIR_PARENT "/share/opencv/haarcascades"
#endif        
        return OPENCV_HAARCASCADES_DIR;
#else
        return "C:/OpenCV/data/haarcascades";
#endif
    }
    
static bool IsStasmInitialized(StasmData& detectors)
{
    return !detectors.mods_g.empty();
}

static void ShapeToLandmarks( // convert Shape to landmarks (float *)
    float*       landmarks,   // out
    const Shape& shape)       // in
{
    CV_Assert(shape.rows <= stasm_NLANDMARKS);
    int i;
    for (i = 0; i < MIN(shape.rows, stasm_NLANDMARKS); i++)
    {
        landmarks[i * 2]     = float(shape(i, IX));
        landmarks[i * 2 + 1] = float(shape(i, IY));
    }
    // set remaining unused landmarks if any to 0,0
    for (; i < stasm_NLANDMARKS; i++)
    {
        landmarks[i * 2]     = 0;
        landmarks[i * 2 + 1] = 0;
    }
}

static const Shape LandmarksAsShape( // return a Shape
    const float* landmarks)          // in
{
    Shape shape(stasm_NLANDMARKS, 2);
    for (int i = 0; i < stasm_NLANDMARKS; i++)
    {
        shape(i, IX) = landmarks[i*2];
        shape(i, IY) = landmarks[i*2+1];
    }
    return shape;
}

} // namespace stasm

//-----------------------------------------------------------------------------

StasmResult::Type stasm_init_ext(stasm::StasmData& detectors,        // extended version of stasm_init
    const char* datadir,   // in: directory of face detector files
//    int         trace,     // in: 0 normal use, 1 trace to stdout and stasm.log
    void*       detparams) // in: NULL or face detector parameters
{
    StasmResult::Type returnval = StasmResult::UNDEFINED;     // assume success
    CatchOpenCvErrs();
    try
    {
//        print_g = (trace != 0);
//        trace_g = (trace != 0);
        if (detectors.mods_g.empty()) // not yet initialized?
        {
#ifdef STASM_TRACE
            if (trace)
            {
                // Open a log file in the current directory (if possible).
                // After the log file is opened, lprintf and stasm_printf
                // will print to stasm.log (as well as to stdout).
                OpenLogFile();
            }
            lprintf("Stasm version %s%s\n",
                    stasm_VERSION, trace? "  Logging to stasm.log": "");
#endif
            CV_Assert(datadir && datadir[0] && STRNLEN(datadir, SLEN) < SLEN);
            InitMods(detectors.mods_g, datadir); // init ASM model(s)
            detectors.face_detector.OpenFaceDetector_(detectors.facedet_g, datadir, detparams);
            OpenEyeMouthDetectors(detectors, detectors.mods_g, datadir);
        }
        if (!IsStasmInitialized(detectors)) {
            returnval = StasmResult::INITIALIZATION_FAILED;
        } else {
            returnval = StasmResult::SUCCESS;
        }
    }
    catch(...)
    {
        returnval = StasmResult::UNDEFINED; // a call was made to Err or a CV_Assert failed
    }
    UncatchOpenCvErrs();
    return returnval;
}

StasmResult::Type stasm_init(stasm::StasmData& detectors,          // call once, at bootup (to read models from disk)
    const char* datadir   // in: directory of face detector files
    ) // MC removed trace argument    // in: 0 normal use, 1 trace to stdout and stasm.log
{
    return stasm_init_ext(detectors, datadir, NULL);
}

StasmResult::Type stasm_open_image_ext(stasm::StasmData& detectors,   // extended version of stasm_open_image
    const char* img,       // in: gray image data, top left corner at 0,0
    int         width,     // in: image width
    int         height,    // in: image height
    const char* imgpath,   // in: image path, used only for err msgs and debug
    bool         multiface, // in: 0=return only one face, 1=allow multiple faces
    int         minwidth,  // in: min face width as percentage of img width
    void*       user)      // in: NULL or pointer to user abort func
{
    if (!IsStasmInitialized(detectors)) {
        return StasmResult::NOT_INITIALIZED;
    }
    StasmResult::Type returnval = StasmResult::SUCCESS;     // assume success
    CatchOpenCvErrs();
    try
    {
        bool pathok = imgpath && STRNLEN(imgpath, SLEN) < SLEN;
        CV_Assert(pathok);
        CV_Assert(minwidth >= 1 && minwidth <= 100);

        

        detectors.img_g = Image(height, width,(unsigned char*)img);

        // call the face detector to detect the face rectangle(s)
        detectors.face_detector.DetectFaces_(detectors.facedet_g, detectors.img_g, imgpath, multiface, minwidth, user);
    }
    catch(...)
    {
        returnval = StasmResult::UNDEFINED; // a call was made to Err or a CV_Assert failed
    }
    UncatchOpenCvErrs();
    return returnval;
}

StasmResult::Type stasm_open_image(stasm::StasmData& detectors,      // call once per image, detect faces
    const char* img,       // in: gray image data, top left corner at 0,0
    int         width,     // in: image width
    int         height,    // in: image height
    const char* imgpath,   // in: image path, used only for err msgs and debug
    bool         multiface, // in: 0=return only one face, 1=allow multiple faces
    int         minwidth)  // in: min face width as percentage of img width
{
    return stasm_open_image_ext(detectors, img, width, height, imgpath,
                                multiface, minwidth, NULL);
}

StasmResult::Type stasm_search_auto_ext(StasmData& context, // extended version of stasm_search_auto
    int*   foundface,      // out: 0=no more faces, 1=found face
    float* landmarks,      // out: x0, y0, x1, y1, ..., caller must allocate
    float* estyaw)         // out: NULL or pointer to estimated yaw
{
    StasmResult::Type returnval = StasmResult::SUCCESS;     // assume success
    *foundface = 0;        // but assume no face found
    if (!IsStasmInitialized(context)) {
        return StasmResult::NOT_INITIALIZED;
    }
    if (context.img_g.rows == 0 || context.img_g.cols == 0) {
        return StasmResult::IMAGE_INVALID;
    }
        
    CatchOpenCvErrs();
    try
    {

        Shape shape;       // the shape with landmarks
        Image face_roi;    // cropped to area around startshape and possibly rotated
        DetPar detpar_roi; // detpar translated to ROI frame
        DetPar detpar;     // params returned by face det, in img frame

        // Get the start shape for the next face in the image, and the ROI around it.
        // The shape will be wrt the ROI frame.
        if (NextStartShapeAndRoi(context, shape, face_roi, detpar_roi, detpar,
                                 context.img_g, context.mods_g, context.face_detector))
        {
            // now working with maybe flipped ROI and start shape in ROI frame
            *foundface = 1;
            if (trace_g)   // show start shape?
                LogShape(RoiShapeToImgFrame(shape, face_roi, detpar_roi, detpar),
                         "auto_start");

            // select an ASM model based on the face's yaw
            const int imod = ABS(EyawAsModIndex(detpar.eyaw, context.mods_g));

            // do the actual ASM search
            shape = context.mods_g[imod]->ModSearch_(shape, face_roi);

            shape = RoiShapeToImgFrame(shape, face_roi, detpar_roi, detpar);
            // now working with non flipped start shape in image frame
            RoundMat(shape);
            ShapeToLandmarks(landmarks, shape);
            if (estyaw)
                *estyaw = float(detpar.yaw);
        }
    }
    catch(...)
    {
        returnval = StasmResult::UNDEFINED; // a call was made to Err or a CV_Assert failed
    }
    UncatchOpenCvErrs();
    return returnval;
}

StasmResult::Type stasm_search_auto(StasmData& detectors, // call repeatedly to find all faces
    int*   foundface,  // out: 0=no more faces, 1=found face
    float* landmarks)  // out: x0, y0, x1, y1, ..., caller must allocate
{
    return stasm_search_auto_ext(detectors, foundface, landmarks, NULL);
}

StasmResult::Type stasm_search_single(StasmData& detectors,   // wrapper for stasm_search_auto and friends
    int*        foundface, // out: 0=no face, 1=found face
    float*      landmarks, // out: x0, y0, x1, y1, ..., caller must allocate
    const char* img,       // in: gray image data, top left corner at 0,0
    int         width,     // in: image width
    int         height,    // in: image height
    const char* imgpath,   // in: image path, used only for err msgs and debug
    const char* datadir)   // in: directory of face detector files
{
    StasmResult::Type result;
    if ((result = stasm_init(detectors, datadir)) != StasmResult::SUCCESS) {
        return result;
    }
    if ((result = stasm_open_image(detectors, img, width, height, imgpath,
                          false, 10 /*minwidth*/))  != StasmResult::SUCCESS) {
        return result;
    }

    result = stasm_search_auto(detectors, foundface, landmarks);
    return result;
}

StasmResult::Type stasm_search_pinned( StasmData& detectors,   // call after the user has pinned some points
    float*       landmarks, // out: x0, y0, x1, y1, ..., caller must allocate
    const float* pinned,    // in: pinned landmarks (0,0 points not pinned)
    const char*  img,       // in: gray image data, top left corner at 0,0
    int          width,     // in: image width
    int          height,    // in: image height
    const char*  imgpath)   // in: image path, used only for err msgs and debug
{
    StasmResult::Type returnval = StasmResult::SUCCESS;     // assume success
    if (!IsStasmInitialized(detectors))
        return StasmResult::NOT_INITIALIZED;
    CatchOpenCvErrs();
    try
    {
        CV_Assert(imgpath && STRNLEN(imgpath, SLEN) < SLEN);

        detectors.img_g = Image(height, width, (unsigned char*)img);

        const Shape pinnedshape(LandmarksAsShape(pinned));

        Shape shape;       // the shape with landmarks
        Image face_roi;    // img cropped to startshape area and maybe rotated
        Shape pinned_roi;  // pinned translated to ROI frame
        DetPar detpar_roi; // detpar translated to ROI frame
        DetPar detpar;     // params returned by pseudo face det, in img frame

        PinnedStartShapeAndRoi(shape, face_roi, detpar_roi, detpar, pinned_roi,
                               detectors.img_g, detectors.mods_g, pinnedshape);

        // now working with maybe flipped ROI and start shape in ROI frame
        const int imod = ABS(EyawAsModIndex(detpar.eyaw, detectors.mods_g));

        shape = detectors.mods_g[imod]->ModSearch_(shape, face_roi, &pinned_roi); // ASM search

        shape = RoiShapeToImgFrame(shape, face_roi, detpar_roi, detpar);
        // now working with non flipped start shape in image frame
        RoundMat(shape);
        ForcePinnedPoints(shape, pinnedshape); // undo above RoundMat on pinned points
        ShapeToLandmarks(landmarks, shape);
        if (trace_g)
            lprintf("\n");
    }
    catch(...)
    {
        returnval = StasmResult::UNDEFINED; // a call was made to Err or a CV_Assert failed
    }
    UncatchOpenCvErrs();
    return returnval;
}

const char* stasm_lasterr(void) // same as LastErr but not in stasm namespace
{
    return LastErr(); // return the last error message (stashed in sgErr)
}

void stasm_force_points_into_image( // force landmarks into image boundary
    float* landmarks,               // io
    int    ncols,                   // in
    int    nrows)                   // in
{
    for (int i = 0; i < stasm_NLANDMARKS; i++)
    {
        landmarks[i * 2]     = Clamp(landmarks[i * 2],     0.f, float(ncols-1));
        landmarks[i * 2 + 1] = Clamp(landmarks[i * 2 + 1], 0.f, float(nrows-1));
    }
}

void stasm_convert_shape( // convert stasm 77 points to given number of points
    float* landmarks,  // io: return all points zero if can't do conversion
    int    nlandmarks) // in: 77=nochange 76=stasm3 68=xm2vts 22=ar 20=bioid 17=me17
{
    Shape newshape = ConvertShape(LandmarksAsShape(landmarks), nlandmarks);
    if (newshape.rows)
        ShapeToLandmarks(landmarks, newshape);
    else // cannot convert, set all points to 0,0
        for (int i = 0; i < stasm_NLANDMARKS; i++)
            landmarks[i * 2] = landmarks[i * 2 + 1] = 0;
}

void stasm_printf(      // print to stdout and to the stasm.log file if it is open
    const char* format, // args like printf
                ...)
{
    char s[SBIG];
    va_list args;
    va_start(args, format);
    VSPRINTF(s, format, args);
    va_end(args);
    lputs(s);
}
