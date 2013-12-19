// eyedet.h: interface to OpenCV eye and mouth detectors
//
// Copyright (C) 2005-2013, Stephen Milborrow

#ifndef STASM_EYEDET_H
#define STASM_EYEDET_H

#include "stasm_lib.h"

namespace stasm
{
void OpenEyeMouthDetectors(StasmData& detectors,  // possibly open OpenCV eye detectors and mouth detector
    const vec_Mod& mods,     // in: the ASM models (used to see if we need eyes or mouth)
    const char*    datadir); // in

void DetectEyesAndMouth(StasmData& detectors,     // use OpenCV detectors to find the eyes and mouth
    DetPar&      detpar,     // io: eye and mouth fields updated, other fields untouched
    const Image& img);       // in: ROI around face (already rotated if necessary)

} // namespace stasm
#endif // STASM_EYEDET_H
