#!/bin/bash

./cmakeclean.sh

############################################################################
## GET THE NETCDF LINKING FLAGS
############################################################################
NCFLAGS="`$NCHOME/bin/nc-config --libs`"
printf "NetCDF Flags: $NCFLAGS\n\n"

############################################################################
## RUN THE CONFIGURE
############################################################################
CXXFLAGS="$CXXFLAGS -std=c++14 -I$NCHOME/include"

printf "CXXFLAGS: $CXXFLAGS\n\n"

cmake      \
  -DCMAKE_CXX_FLAGS:STRING="$CXXFLAGS"   \
  -DNCFLAGS:STRING="$NCFLAGS"            \
  -DARCH:STRING="$ARCH"                  \
  -DCUDA_FLAGS:STRING="$CUDA_ARCH"       \
  -DYAKL_CUB_HOME="$CUBHOME"             \
  -DYAKL_HOME="$YAKLHOME"                \
  ..

