# - Top level script for CheckCXX11Support project
#
#-----------------------------------------------------------------------
# Copyright (c) 2014, Ben Morgan <bmorgan.warwick@gmail.com>
#
# Distributed under the OSI-approved BSD 3-Clause License (the "License");
# see accompanying file License.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Use of the CXX11 checks requires cmake 2.8.3 at minimum, so also
# require this here
#
cmake_minimum_required(VERSION 2.8.3)
project(CheckCXX11Support)

# - Add CXX11 Modules
list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/Modules)

# - Check Features
include(CheckCXX11Features)
include(CheckCXXStandardLibrary)

#-----------------------------------------------------------------------
# Example generation of a header indicating availability of C++11 features
#
configure_file(example_header.hpp.in example_header.hpp)

