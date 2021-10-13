<p align="center">
    <a href="https://github.com/DevelopersToolbox/">
        <img src="https://cdn.wolfsoftware.com/assets/images/github/organisations/developerstoolbox/black-and-white-circle-256.png" alt="DevelopersToolbox logo" />
    </a>
    <br />
    <a href="https://github.com/DevelopersToolbox/os-detect/actions/workflows/pipeline.yml">
        <img src="https://img.shields.io/github/workflow/status/DevelopersToolbox/os-detect/pipeline/master?style=for-the-badge" alt="Github Build Status">
    </a>
    <a href="https://github.com/DevelopersToolbox/os-detect/releases/latest">
        <img src="https://img.shields.io/github/v/release/DevelopersToolbox/os-detect?color=blue&label=Latest%20Release&style=for-the-badge" alt="Release">
    </a>
    <a href="https://github.com/DevelopersToolbox/os-detect/releases/latest">
        <img src="https://img.shields.io/github/commits-since/DevelopersToolbox/os-detect/latest.svg?color=blue&style=for-the-badge" alt="Commits since release">
    </a>
    <br />
    <a href=".github/CODE_OF_CONDUCT.md">
        <img src="https://img.shields.io/badge/Code%20of%20Conduct-blue?style=for-the-badge" />
    </a>
    <a href=".github/CONTRIBUTING.md">
        <img src="https://img.shields.io/badge/Contributing-blue?style=for-the-badge" />
    </a>
    <a href=".github/SECURITY.md">
        <img src="https://img.shields.io/badge/Report%20Security%20Concern-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/DevelopersToolbox/os-detect/issues">
        <img src="https://img.shields.io/badge/Get%20Support-blue?style=for-the-badge" />
    </a>
    <br />
    <a href="https://wolfsoftware.com/">
        <img src="https://img.shields.io/badge/Created%20by%20Wolf%20Software-blue?style=for-the-badge" />
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
* OSD_BASEDON
* OSD_KERNEL
* OSD_ARCH

<a name="example-output"></a>
## Examples of usage by OS

### Debian

```shell
OS: Linux
DISTRIBUTION: debian
NAME: Debian GNU/Linux
CODENAME: stretch
RELEASE: 9.2
VERSION: 9
BASEDON: debian
KERNEL: 4.9.49-moby
ARCH: x86_64
```

### Ubuntu

```shell
OS: Linux
DISTRIBUTION: ubuntu
NAME: Ubuntu
CODENAME: Xenial Xerus
RELEASE: 16.04
VERSION: 16.04
BASEDON: debian
KERNEL: 4.9.49-moby
ARCH: x86_64
```

### Mac OS X

```shell
OS: Mac OS
DISTRIBUTION: unknown
NAME: Mac OS X
CODENAME: unknown
RELEASE: 10.13.1
VERSION: unknown
BASEDON: unknown
KERNEL: 17.2.0
ARCH: x86_64
```

### Centos

```shell
OS: Linux
DISTRIBUTION: centos
NAME: CentOS Linux
CODENAME: Core
RELEASE: 7.4.1708
VERSION: 7
BASEDON: rhel fedora
KERNEL: 4.9.49-moby
ARCH: x86_64
```

### Suse

```shell
OS: Linux
DISTRIBUTION: opensuse
NAME: openSUSE Leap
CODENAME: Malachite
RELEASE: 42.3
VERSION: 42.3
BASEDON: suse
KERNEL: 4.9.49-moby
ARCH: x86_64
```

### Amazon Linux

```shell
OS: Linux
DISTRIBUTION: amzn
NAME: Amazon Linux AMI
CODENAME: unknown
RELEASE: 2017.09
VERSION: 2017.09
BASEDON: rhel fedora
KERNEL: 4.9.49-moby
ARCH: x86_64
```
