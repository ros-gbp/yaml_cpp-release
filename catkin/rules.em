#!/usr/bin/make -f
# -*- makefile -*-
# Sample debian/rules that uses debhelper.
# This file was originally written by Joey Hess and Craig Small.
# As a special exception, when this file is copied by dh-make into a
# dh-make output file, you may use that output file without restriction.
# This special exception was added by Craig Small in version 0.37 of dh-make.

# Uncomment this to turn on verbose mode.
export DH_VERBOSE=1
export DH_OPTIONS=-v
export CMAKE_PREFIX_PATH="@(INSTALL_PREFIX)"
CMAKE_FLAGS = \
	-DBUILD_SHARED_LIBS=ON \

%:
	dh  $@@

override_dh_auto_configure:
	dh_auto_configure -Scmake -- \
		-DCMAKE_INSTALL_PREFIX="@(INSTALL_PREFIX)" \
		-DCMAKE_PREFIX_PATH="@(INSTALL_PREFIX)" \
		-DCATKIN=YES \
		$(CMAKE_FLAGS)
