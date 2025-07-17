cmake_minimum_required(VERSION 3.15)

if(DEFINED ENV{PSPDEV})
  set(PSPDEV $ENV{PSPDEV})
else()
  message(FATAL_ERROR "The environment variable PSPDEV needs to be defined.")
endif()

set(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR mips)

set(CMAKE_C_COMPILER "${PSPDEV}/bin/psp-gcc")
set(CMAKE_CXX_COMPILER "${PSPDEV}/bin/psp-g++")
set(PKG_CONFIG_EXECUTABLE "${PSPDEV}/bin/psp-pkg-config" CACHE STRING "Path to pkg-config")

set(CMAKE_C_FLAGS_INIT "-I${PSPDEV}/psp/include -I${PSPDEV}/psp/sdk/include -D_PSP_FW_VERSION=600 -DPSP -D__PSP__")
set(CMAKE_CXX_FLAGS_INIT "${CMAKE_C_FLAGS_INIT}")
set(CMAKE_EXE_LINKER_FLAGS_INIT "-L${PSPDEV}/psp/lib -L${PSPDEV}/psp/sdk/lib -Wl,-zmax-page-size=128")

# For find_* commands
set(CMAKE_SYSROOT "${PSPDEV}")
set(CMAKE_FIND_ROOT_PATH "${CMAKE_SYSROOT}" "${CMAKE_SYSROOT}/psp" "${CMAKE_SYSROOT}/psp/sdk")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_INSTALL_PREFIX "${PSPDEV}/psp" CACHE PATH "install path")

include("${PSPDEV}/psp/share/CreatePBP.cmake")
include("${PSPDEV}/psp/share/AddPrxModule.cmake")
