#!/usr/bin/env sh

GLEW_VERSION=2.1.0
GLFW_VERSION=3.3

SETUP_DIR=$(cd $(dirname $0) && pwd)

cd $SETUP_DIR

##############
# Setup GLEW #
##############

cd $SETUP_DIR

# Download and extract the archive.
echo * Setup GLEW
echo Downloading...
curl -fsSL -o glew.zip https://github.com/nigels-com/glew/releases/download/glew-$GLEW_VERSION/glew-$GLEW_VERSION.zip
echo Extracting...
unzip -o glew.zip
rm glew.zip

# Build the library.
cd glew-$GLEW_VERSION
echo Building...
make

# HACK: Modify RPATH in libGLEW.dylib.
# Force changing RPATH to CubismNativeSamples directory.
echo Modifying RPATH...
install_name_tool -id @rpath/libGLEW.dylib lib/libGLEW.dylib

##############
# Setup GLFW #
##############

cd $SETUP_DIR

# Download and extract the archive.
echo * Setup GLFW
echo Downloading...
curl -fsSL -o glfw.zip https://github.com/glfw/glfw/releases/download/$GLFW_VERSION/glfw-$GLFW_VERSION.zip
echo Extracting...
unzip -o glfw.zip
rm glfw.zip

# Build the library.
cd glfw-$GLFW_VERSION
cmake -DBUILD_SHARED_LIBS=ON .
echo Building...
make

# Move .dylib files to lib directory.
mkdir -p lib
mv src/*.dylib lib
