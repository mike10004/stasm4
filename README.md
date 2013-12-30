stasm4
======

Fork of STASM face landmarking software, customized for Linux.

From the upstream website:
> Stasm is a C++ software library for finding features in faces. You give 
it an image of a face and it returns the positions of the facial features. 
Stasm is designed to work on front views of faces with neutral expressions.

Please see `doc/HISTORY.txt` and http://www.milbo.users.sonic.net/stasm for 
further details on upstream sources.

The motivation for this fork is 
 1. to eliminate segfaults occurring in destructors of some OpenCV objects
 2. to modify and arrange code for easier building on Linux with common
     build environment configurations
 3. to streamline for packaging Linux binaries

Modifications to the upstream sources are distributed under the same license
as those sources (BSD 2-clause). Note original the author's warning that 
some techniques embodied in the software may be encumbered by patents that 
the source code license does not cover.

On Ubuntu, you can install binaries generated from these modified sources
by adding the PPA https://launchpad.net/~mchaberski/+archive/ppa to your
repository sources. Follow the PPA link above for more detailed instructions,
but this is the short version:

    $ sudo add-apt-repository ppa:mchaberski/ppa
    $ sudo apt-get update
    $ sudo apt-get install stasm4-utils

That will install the `stasm4-utils` package, which contains the `stasmark`
executable that can be used to detect landmarks in images with faces. The
executable provides limited functionality and flexibility; it's just a 
starting point for decisions about how to stabilize the development 
environment and how best to expose library functionality through executables.

Please use the [Issues](https://github.com/mike10004/stasm4/issues) page
to ask questions, file bug reports, or request improvements. (Use the 
question, bug, and enhancement labels as appropriate.)


