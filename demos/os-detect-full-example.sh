#!/usr/bin/env bash

# -------------------------------------------------------------------------------- #
# Description                                                                      #
# -------------------------------------------------------------------------------- #
# This is a very simple (almost trivial) example of how to make use of the         #
# os-detect script and embed os detection into your scripts.                       #
# -------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------- #
# Use the source                                                                   #
# -------------------------------------------------------------------------------- #
# Source the os-detect script to make the variables available.                     #
# -------------------------------------------------------------------------------- #

# shellcheck disable=SC2312
SCRIPTPATH="$( dirname "$( cd "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )" )"

# shellcheck disable=SC1090,SC1091
source "${SCRIPTPATH}"/src/os-detect.sh

# -------------------------------------------------------------------------------- #
# Example usage                                                                    #
# -------------------------------------------------------------------------------- #
# This is an example showing how to use the variables in your own script.          #
# -------------------------------------------------------------------------------- #

declare OSD_OS
declare OSD_DISTRIBUTION
declare OSD_NAME
declare OSD_CODENAME
declare OSD_RELEASE
declare OSD_VERSION
declare OSD_PLATFORM_VERSION
declare OSD_BASEDON
declare OSD_KERNEL
declare OSD_ARCH

# -------------------------------------------------------------------------------- #
# Full detection                                                                   #
# -------------------------------------------------------------------------------- #
# Call the full_os_detect function to do a full detection, you can also call the   #
# individual detection functions directly.                                         #
#                                                                                  #
# detect_os                                                                        #
# detect_kernel                                                                    #
# detect_architecture                                                              #
# detect_distribution                                                              #
# detect_name                                                                      #
# detect_version                                                                   #
# detect_release                                                                   #
# detect_codename                                                                  #
# detect_basedon                                                                   #
# -------------------------------------------------------------------------------- #

full_os_detect

# -------------------------------------------------------------------------------- #
# Display Results                                                                  #
# -------------------------------------------------------------------------------- #
# Display the resultant variables. If you call specific detection functions        #
# directly instead of the full detection then not all variables will exist.        #
# -------------------------------------------------------------------------------- #

echo "OS:               ${OSD_OS}"
echo "DISTRIBUTION:     ${OSD_DISTRIBUTION}"
echo "NAME:             ${OSD_NAME}"
echo "CODENAME:         ${OSD_CODENAME}"
echo "RELEASE:          ${OSD_RELEASE}"
echo "VERSION:          ${OSD_VERSION}"
echo "PLATFORM VERSION: ${OSD_PLATFORM_VERSION}"
echo "BASEDON:          ${OSD_BASEDON}"
echo "KERNEL:           ${OSD_KERNEL}"
echo "ARCH:             ${OSD_ARCH}"

# -------------------------------------------------------------------------------- #
# End of Script                                                                    #
# -------------------------------------------------------------------------------- #
# This is the end - nothing more to see here.                                      #
# -------------------------------------------------------------------------------- #

