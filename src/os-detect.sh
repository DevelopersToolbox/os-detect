#!/usr/bin/env bash

# -------------------------------------------------------------------------------- #
# Description                                                                      #
# -------------------------------------------------------------------------------- #
# This is a simple script which attempts to detection which operating system your  #
# script is running on. This should allow you to write complex scripts which have  #
# OS detection and OS specific syntax.                                             #
# -------------------------------------------------------------------------------- #

shopt -s extglob

# -------------------------------------------------------------------------------- #
# Required commands                                                                #
# -------------------------------------------------------------------------------- #
# These commands MUST exist in order for the script to correctly run.              #
# -------------------------------------------------------------------------------- #

PREREQ_COMMANDS=( 'awk' )

# -------------------------------------------------------------------------------- #
# Check Prerequisites                                                              #
# -------------------------------------------------------------------------------- #
# Check to ensure that the prerequisite commmands exist.                           #
# -------------------------------------------------------------------------------- #

function check_prereqs()
{
    local error_count=0

    for i in "${PREREQ_COMMANDS[@]}"
    do
        command=$(command -v "${i}" || true)
        if [[ -z ${command} ]]; then
            echo "Error: ${i} is not in your command path"
            error_count=$((error_count+1))
        fi
    done

    if [[ ${error_count} -gt 0 ]]; then
        echo "Error: ${error_count} errors located - fix before re-running";
        exit
    fi
}

# -------------------------------------------------------------------------------- #
# Clean String                                                                     #
# -------------------------------------------------------------------------------- #
# Clean the presented string and remove unwanted characters. [Order IS important!] #
# -------------------------------------------------------------------------------- #

function clean_string()
{
    clean="$1"

    clean="${clean##*( )}"                          # Remove leading spaces
    clean="${clean%%*( )}"                          # Remove trailing spaces
    clean="${clean#\"*}"                            # Remove leading string quotes
    clean="${clean%\"*}"                            # Remove trailing string quotes
    clean="${clean##*( )}"                          # Remove leading spaces
    clean="${clean%%*( )}"                          # Remove trailing spaces
    clean="${clean##+([[:space:]])}"                # Use extended globbing to remove whitespace

    echo "${clean}"
}

# -------------------------------------------------------------------------------- #
# Operating System                                                                 #
# -------------------------------------------------------------------------------- #
# Attempt to detect the operating system.                                          #
# -------------------------------------------------------------------------------- #

function detect_os
{
    if [[ -z ${OSD_OS} ]]; then
        OSD_OS=$(uname)
        OSD_OS=$(clean_string "${OSD_OS}")

        if [[ "${OSD_OS}" == "Darwin" ]]; then
            OSD_OS='Mac OS'
        fi
        readonly OSD_OS
    fi
}

# -------------------------------------------------------------------------------- #
# Kernal Version                                                                   #
# -------------------------------------------------------------------------------- #
# Attempt to detect to kernel release version.                                     #
# -------------------------------------------------------------------------------- #

function detect_kernel
{
    if [[ -z ${OSD_KERNEL} ]]; then
        OSD_KERNEL=$(uname -r)
        OSD_KERNEL=$(clean_string "${OSD_KERNEL}")
        readonly OSD_KERNEL
    fi
}

# -------------------------------------------------------------------------------- #
# Architecture                                                                     #
# -------------------------------------------------------------------------------- #
# Attempt to detect the machine architecture.                                      #
# -------------------------------------------------------------------------------- #

function detect_architecture
{
    if [[ -z ${OSD_ARCH} ]]; then
        OSD_ARCH=$(uname -m)
        OSD_ARCH=$(clean_string "${OSD_ARCH}")
        readonly OSD_ARCH
    fi
}

# -------------------------------------------------------------------------------- #
# Distribution                                                                     #
# -------------------------------------------------------------------------------- #
#  Attempt to detect the distribution name.                                        #
# -------------------------------------------------------------------------------- #

function detect_distribution
{
    if [[ -z ${OSD_DISTRIBUTION} ]]; then
        if type "lsb_release" > /dev/null 2>&1; then
            # shellcheck disable=SC2312
            OSD_DISTRIBUTION=$(lsb_release -a | grep 'Distributor ID' | awk -F: '{ print $2 }')
        else
            if [[ -f /etc/redhat-release ]]; then
                OSD_DISTRIBUTION=$(sed s/\ release.*// < /etc/redhat-release)
            fi

            if [[ -f /etc/os-release ]]; then
                # shellcheck disable=SC2312
                OSD_DISTRIBUTION=$(grep '^ID' /etc/os-release | grep -v '^ID_LIKE' | awk -F= '{ print $2 }')
            fi
        fi
        if [[ -z "${OSD_DISTRIBUTION}" ]]; then
            OSD_DISTRIBUTION="unknown"
        fi
        OSD_DISTRIBUTION=$(clean_string "${OSD_DISTRIBUTION}")
        readonly OSD_DISTRIBUTION
    fi
}

# -------------------------------------------------------------------------------- #
# OS Name                                                                          #
# -------------------------------------------------------------------------------- #
# Attempt to detect the OS name.                                                   #
# -------------------------------------------------------------------------------- #

function detect_name
{
    if [[ -z ${OSD_NAME} ]]; then
        if [[ "${OSD_OS}" == "Mac OS" ]]; then
            OSD_NAME=$(sw_vers -productName)
        elif [[ -f /etc/os-release ]]; then
            # shellcheck disable=SC2312
            OSD_NAME=$(grep '^NAME' /etc/os-release | awk -F= '{ print $2 }')
        fi

        if [[ -z "${OSD_NAME}" ]]; then
            OSD_NAME="unknown"
        fi
        OSD_NAME=$(clean_string "${OSD_NAME}")
        readonly OSD_NAME
    fi
}

# -------------------------------------------------------------------------------- #
# Version                                                                          #
# -------------------------------------------------------------------------------- #
# Attempt to detect the operating system version.                                  #
# -------------------------------------------------------------------------------- #

function  detect_version
{
    if [[ -z ${OSD_VERSION} ]]; then
        if [[ -f /etc/os-release ]]; then
            # shellcheck disable=SC2312
            OSD_VERSION=$(grep '^VERSION_ID' /etc/os-release | awk -F= '{ print $2 }')
        fi

        if [[ -z "${OSD_VERSION}" ]]; then
            OSD_VERSION="unknown"
        fi
        OSD_VERSION=$(clean_string "${OSD_VERSION}")
        readonly OSD_VERSION
    fi
}

# -------------------------------------------------------------------------------- #
# Platform Version                                                                 #
# -------------------------------------------------------------------------------- #
# Get the platform version, this is mostly for RedHat based OSs.                   #
# -------------------------------------------------------------------------------- #

function detect_platform_version
{
    if [[ -z ${OSD_PLATFORM_VERSION} ]]; then
        if [[ -f /etc/os-release ]]; then
            # shellcheck disable=SC2312
            OSD_PLATFORM_VERSION=$(grep '^PLATFORM_ID' /etc/os-release | awk -F=  '{ print $2 }' | awk -F:  '{ print $2 }')
            # shellcheck disable=SC2312
            OSD_PLATFORM_VERSION=${OSD_PLATFORM_VERSION/el/el-}
        fi

        if [[ -z "${OSD_BASEDON}" ]]; then
            OSD_PLATFORM_VERSION="unknown"
        fi
        OSD_PLATFORM_VERSION=$(clean_string "${OSD_PLATFORM_VERSION}")
        readonly OSD_PLATFORM_VERSION
    fi
}

# -------------------------------------------------------------------------------- #
# Release                                                                          #
# -------------------------------------------------------------------------------- #
# Attempt to detect the release version.                                           #
# -------------------------------------------------------------------------------- #

function detect_release
{
    if [[ -z ${OSD_RELEASE} ]]; then
        if [[ "${OSD_OS}" == "Mac OS" ]]; then
            OSD_RELEASE=$(sw_vers -productVersion)
        else
            if type "lsb_release" > /dev/null 2>&1; then
                # shellcheck disable=SC2312
                OSD_RELEASE=$(lsb_release -a | grep 'Release' | awk -F: '{ print $2 }')
            else
                if [[ -f /etc/debian_version ]]; then
                    OSD_RELEASE=$(cat /etc/debian_version)
                    if [[ -f /etc/os-release ]]; then
                        # shellcheck disable=SC2312
                        TMP_DISTRIBUTION=$(grep '^ID' /etc/os-release | grep -v '^ID_LIKE' | awk -F= '{ print $2 }')
                        if [[ "${TMP_DISTRIBUTION}" = "ubuntu" ]]; then
                            # shellcheck disable=SC2312
                            OSD_RELEASE=$(grep '^VERSION_ID' /etc/os-release | awk -F= '{ print $2 }')
                        fi
                    fi
                elif [[ -f /etc/redhat-release ]]; then
                    # shellcheck disable=SC2312
                    OSD_RELEASE=$(sed s/.*release\ // /etc/redhat-release | sed s/\ .*//)
                elif [[ -f /etc/os-release ]]; then
                    # shellcheck disable=SC2312
                    OSD_RELEASE=$(grep '^VERSION' /etc/os-release | grep -v 'VERSION_ID' | awk -F= '{ print $2 }')
                fi
            fi
        fi
        if [[ -z "${OSD_RELEASE}" ]]; then
            OSD_RELEASE="unknown"
        fi
        OSD_RELEASE=$(clean_string "${OSD_RELEASE}")
        readonly OSD_RELEASE
    fi
}

# -------------------------------------------------------------------------------- #
# Codename                                                                         #
# -------------------------------------------------------------------------------- #
# Attempt to detect to operating system codename                                   #
# -------------------------------------------------------------------------------- #

function detect_codename
{
    if [[ -z ${OSD_CODENAME} ]]; then
        if type "lsb_release" > /dev/null 2>&1; then
            # shellcheck disable=SC2312
            OSD_CODENAME=$(lsb_release -a | grep 'Codename' | awk -F: '{ print $2 }')
        else
            if [[ -f /etc/debian_version ]]; then
                if [[ -f /etc/os-release ]]; then
                    # shellcheck disable=SC2312
                    TMP_DISTRIBUTION=$(grep '^ID' /etc/os-release | grep -v '^ID_LIKE' | awk -F= '{ print $2 }')
                    if [[ "${TMP_DISTRIBUTION}" = "ubuntu" ]]; then
                        # shellcheck disable=SC2312
                        OSD_CODENAME=$(grep '^UBUNTU_CODENAME' /etc/os-release | awk -F= '{ print $2 }')
                    else
                        OSD_CODENAME=$(awk -F"[)(]+" '/VERSION=/ {print $2}' /etc/os-release)
                    fi
                fi
            elif [[ -f /etc/redhat-release ]]; then
                # shellcheck disable=SC2312
                OSD_CODENAME=$(sed s/.*\(// /etc/redhat-release | sed s/\)//)
            fi
        fi

        if [[ -z "${OSD_CODENAME}" ]]; then
            OSD_CODENAME="unknown"
        fi
        OSD_CODENAME=$(clean_string "${OSD_CODENAME}")
        readonly OSD_CODENAME
    fi
}

# -------------------------------------------------------------------------------- #
# Based On                                                                         #
# -------------------------------------------------------------------------------- #
# Attempt to detect which operating system this operating system is based on.      #
# -------------------------------------------------------------------------------- #

function detect_basedon
{
    if [[ -z ${OSD_BASEDON} ]]; then
        if [[ -f /etc/os-release ]]; then
            # shellcheck disable=SC2312
            OSD_BASEDON=$(grep '^ID_LIKE' /etc/os-release | awk -F= '{ print $2 }')
        fi

        if [[ -f /etc/debian_version ]] && [[ -z "${OSD_BASEDON}" ]]; then
            OSD_BASEDON="debian"
        elif [[ -f /etc/redhat-release ]] &&  [[ -z "${OSD_BASEDON}" ]]; then
            OSD_BASEDON="redhat"
        fi

        if [[ -z "${OSD_BASEDON}" ]]; then
            OSD_BASEDON="unknown"
        fi
        OSD_BASEDON=$(clean_string "${OSD_BASEDON}")
        readonly OSD_BASEDON
    fi
}

# -------------------------------------------------------------------------------- #
# Full Detection                                                                   #
# -------------------------------------------------------------------------------- #
# A simple wrapper to run ALL of the detection funtions.                           #
# -------------------------------------------------------------------------------- #

function full_os_detect
{
    detect_os
    detect_kernel
    detect_architecture
    detect_distribution
    detect_name
    detect_version
    detect_platform_version
    detect_release
    detect_codename
    detect_basedon
}

# -------------------------------------------------------------------------------- #
# Check Prerequisites                                                              #
# -------------------------------------------------------------------------------- #
# Make sure we check everything we need is installed.                              #
# -------------------------------------------------------------------------------- #

check_prereqs

# -------------------------------------------------------------------------------- #
# End of Script                                                                    #
# -------------------------------------------------------------------------------- #
# This is the end - nothing more to see here.                                      #
# -------------------------------------------------------------------------------- #
