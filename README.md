<!-- markdownlint-disable -->
<p align="center">
    <a href="https://github.com/DevelopersToolbox/">
        <img src="https://cdn.wolfsoftware.com/assets/images/github/organisations/developerstoolbox/black-and-white-circle-256.png" alt="DevelopersToolbox logo" />
    </a>
    <br />
    <a href="https://github.com/DevelopersToolbox/os-detect/actions/workflows/cicd.yml">
        <img src="https://img.shields.io/github/actions/workflow/status/DevelopersToolbox/os-detect/cicd.yml?branch=master&label=build%20status&style=for-the-badge" alt="Github Build Status" />
    </a>
    <a href="https://github.com/DevelopersToolbox/os-detect/blob/master/LICENSE.md">
        <img src="https://img.shields.io/github/license/DevelopersToolbox/os-detect?color=blue&label=License&style=for-the-badge" alt="License">
    </a>
    <a href="https://github.com/DevelopersToolbox/os-detect">
        <img src="https://img.shields.io/github/created-at/DevelopersToolbox/os-detect?color=blue&label=Created&style=for-the-badge" alt="Created">
    </a>
    <br />
    <a href="https://github.com/DevelopersToolbox/os-detect/releases/latest">
        <img src="https://img.shields.io/github/v/release/DevelopersToolbox/os-detect?color=blue&label=Latest%20Release&style=for-the-badge" alt="Release">
    </a>
    <a href="https://github.com/DevelopersToolbox/os-detect/releases/latest">
        <img src="https://img.shields.io/github/release-date/DevelopersToolbox/os-detect?color=blue&label=Released&style=for-the-badge" alt="Released">
    </a>
    <a href="https://github.com/DevelopersToolbox/os-detect/releases/latest">
        <img src="https://img.shields.io/github/commits-since/DevelopersToolbox/os-detect/latest.svg?color=blue&style=for-the-badge" alt="Commits since release">
    </a>
    <br />
    <a href="https://github.com/DevelopersToolbox/os-detect/blob/master/.github/CODE_OF_CONDUCT.md">
        <img src="https://img.shields.io/badge/Code%20of%20Conduct-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/DevelopersToolbox/os-detect/blob/master/.github/CONTRIBUTING.md">
        <img src="https://img.shields.io/badge/Contributing-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/DevelopersToolbox/os-detect/blob/master/.github/SECURITY.md">
        <img src="https://img.shields.io/badge/Report%20Security%20Concern-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/DevelopersToolbox/os-detect/issues">
        <img src="https://img.shields.io/badge/Get%20Support-blue?style=for-the-badge" />
    </a>
</p>

## Overview

A script for working out what OS you are running on as some scripts need to be OS aware.

## Table of Contents
1. [Usage](#usage)
1. [Functions](#functions)
1. [Environment Variables](#environment-variables)
1. [Example Output](#example-output)

<a name="usage"></a>
## Usage

### Simple Usage

```shell
source os-detect.sh

full_os_detect

echo "OS: $OSD_OS"
echo "DISTRIBUTION: $OSD_DISTRIBUTION"
echo "NAME: $OSD_NAME"
echo "CODENAME: $OSD_CODENAME"
echo "RELEASE: $OSD_RELEASE"
echo "VERSION: $OSD_VERSION"
echo "PLATFORM_VERSION: $OSD_PLATFORM_VERSION"
echo "BASEDON: $OSD_BASEDON"
echo "KERNEL: $OSD_KERNEL"
echo "ARCH: $OSD_ARCH"
```

### Custom usage

```shell
source os-detect.sh

detect_distribution
detect_version

echo "DISTRIBUTION: $OSD_DISTRIBUTION"
echo "VERSION: $OSD_VERSION"
```

<a name="functions"></a>
## Functions

The following functions exist:

* detect_os
* detect_kernel
* detect_architecture
* detect_distribution
* detect_name
* detect_version
* detect_platform_version
* detect_release
* detect_codename
* detect_basedon
* full_os_detect

<a name="environment-variables"></a>
## Environment Variables

The following environment variables are set:

* OSD_OS
* OSD_DISTRIBUTION
* OSD_NAME
* OSD_CODENAME
* OSD_RELEASE
* OSD_VERSION
* OSD_PLATFORM_VERSION
* OSD_BASEDON
* OSD_KERNEL
* OSD_ARCH

<a name="example-output"></a>
## Examples of usage by OS

### Alma Linux

```shell
OS:               Linux
DISTRIBUTION:     almalinux
NAME:             AlmaLinux
CODENAME:         Arctic Sphynx
RELEASE:          8.5
VERSION:          8.5
PLATFORM VERSION: el-8
BASEDON:          rhel centos fedora
KERNEL:           5.10.76-linuxkit
ARCH:             x86_64
```

### Alpine

```shell
OS:               Linux
DISTRIBUTION:     alpine
NAME:             Alpine Linux
CODENAME:         unknown
RELEASE:          unknown
VERSION:          3.14.2
PLATFORM VERSION: unknown
BASEDON:          unknown
KERNEL:           5.10.76-linuxkit
ARCH:             x86_64
```

### Amazon Linux

```shell
OS:               Linux
DISTRIBUTION:     amzn
NAME:             Amazon Linux
CODENAME:         unknown
RELEASE:          2
VERSION:          2
PLATFORM VERSION: unknown
BASEDON:          centos rhel fedora
KERNEL:           5.10.76-linuxkit
ARCH:             x86_64
```

### Arch Linux

```shell
OS:               Linux
DISTRIBUTION:     arch
NAME:             Arch Linux
CODENAME:         unknown
RELEASE:          unknown
VERSION:          unknown
PLATFORM VERSION: unknown
BASEDON:          unknown
KERNEL:           5.10.76-linuxkit
ARCH:             x86_64
```

### Centos

```shell
OS:               Linux
DISTRIBUTION:     centos
NAME:             CentOS Linux
CODENAME:         Core
RELEASE:          7.9.2009
VERSION:          7
PLATFORM VERSION: unknown
BASEDON:          rhel fedora
KERNEL:           5.10.76-linuxkit
ARCH:             x86_64
```

### Debian

```shell
OS:               Linux
DISTRIBUTION:     debian
NAME:             Debian GNU/Linux
CODENAME:         bullseye
RELEASE:          11.1
VERSION:          11
PLATFORM VERSION: unknown
BASEDON:          debian
KERNEL:           5.10.76-linuxkit
ARCH:             x86_64
```

### Mac OS

```shell
OS:               Mac OS
DISTRIBUTION:     unknown
NAME:             macOS
CODENAME:         unknown
RELEASE:          12.2.1
VERSION:          unknown
PLATFORM VERSION: unknown
BASEDON:          unknown
KERNEL:           21.3.0
ARCH:             x86_64
```

### Oracle Linux

```shell
OS:               Linux
DISTRIBUTION:     ol
NAME:             Oracle Linux Server
CODENAME:         Ootpa
RELEASE:          8.5
VERSION:          8.5
PLATFORM VERSION: el-8
BASEDON:          fedora
KERNEL:           5.10.76-linuxkit
ARCH:             x86_64
```

### Photon Linux

```shell
OS:               Linux
DISTRIBUTION:     photon
NAME:             VMware Photon OS
CODENAME:         unknown
RELEASE:          4.0
VERSION:          4.0
PLATFORM VERSION: unknown
BASEDON:          unknown
KERNEL:           5.10.76-linuxkit
ARCH:             x86_64
```

### Rocky Linux

```shell
OS:               Linux
DISTRIBUTION:     rocky
NAME:             Rocky Linux
CODENAME:         Green Obsidian
RELEASE:          8.5
VERSION:          8.5
PLATFORM VERSION: el-8
BASEDON:          rhel centos fedora
KERNEL:           5.10.76-linuxkit
ARCH:             x86_64
```

### Scientific Linux

```shell
OS:               Linux
DISTRIBUTION:     scientific
NAME:             Scientific Linux
CODENAME:         Nitrogen
RELEASE:          7.9
VERSION:          7.9
PLATFORM VERSION: unknown
BASEDON:          rhel centos fedora
KERNEL:           5.10.76-linuxkit
ARCH:             x86_64
```

### Ubuntu

```shell
OS:               Linux
DISTRIBUTION:     ubuntu
NAME:             Ubuntu
CODENAME:         focal
RELEASE:          20.04
VERSION:          20.04
PLATFORM VERSION: unknown
BASEDON:          debian
KERNEL:           5.10.76-linuxkit
ARCH:             x86_64
```

<br />
<p align="right"><a href="https://wolfsoftware.com/"><img src="https://img.shields.io/badge/Created%20by%20Wolf%20on%20behalf%20of%20Wolf%20Software-blue?style=for-the-badge" /></a></p>
