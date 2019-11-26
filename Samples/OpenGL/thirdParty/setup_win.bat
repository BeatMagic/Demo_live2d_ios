@echo off

set GLEW_VERSION=2.1.0
set GLFW_VERSION=3.3

set SETUP_DIR=%~dp0

::::::::::::::::
:: Setup GLEW ::
::::::::::::::::

cd %SETUP_DIR%

:: Download and extract the archive.
echo * Setup GLEW
echo Downloading...
curl -#L -o glew.zip https://github.com/nigels-com/glew/releases/download/glew-%GLEW_VERSION%/glew-%GLEW_VERSION%-win32.zip
echo Extracting...
powershell expand-archive -force glew.zip .
del glew.zip

::::::::::::::::::::::
:: Setup GLFW WIN32 ::
::::::::::::::::::::::

echo.

:: Download and extract the archive.
echo * Setup GLFW WIN32
echo Downloading...
curl -#L -o glfw.zip https://github.com/glfw/glfw/releases/download/%GLFW_VERSION%/glfw-%GLFW_VERSION%.bin.WIN32.zip
echo Extracting...
powershell expand-archive -force glfw.zip .
del glfw.zip

::::::::::::::::::::::
:: Setup GLFW WIN64 ::
::::::::::::::::::::::

echo.

:: Download and extract the archive.
echo * Setup GLFW WIN64
echo Downloading...
curl -#L -o glfw.zip https://github.com/glfw/glfw/releases/download/%GLFW_VERSION%/glfw-%GLFW_VERSION%.bin.WIN64.zip
echo Extracting...
powershell expand-archive -force glfw.zip .
del glfw.zip

echo.
pause
