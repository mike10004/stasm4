stasm4
======

Fork of STASM face landmarking software, customized for Linux.

From the upstream website:
> Stasm is a C++ software library for finding features in faces. You give 
it an image of a face and it returns the positions of the facial features. 
Stasm is designed to work on front views of faces with neutral expressions.

Please see doc/HISTORY.txt and www.milbo.users.sonic.net/stasm for further 
details on upstream sources.

The motivation for this fork is 
 1. to eliminate segfaults occurring in destructors of some OpenCV objects
 2. to modify and arrange code for easier building on Linux with common
     build environment configurations
 3. to streamline for packaging Linux binaries

Modifications to the upstream sources are distributed under the same license
as those sources (BSD 2-clause). Note the author's warning that some
techniques embodied in the software may be encumbered by patents that the 
source code license does not cover.

