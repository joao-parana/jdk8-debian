# JDK 8 on Debian wheezy

# Table of Contents
- [Introduction](#introduction)
    - [Version](#version)
- [Installation](#installation)
- [Quick Start](#quick-start)

# Introduction

Dockerfile to build a JDK 8 container image using Java from Oracle.

## Version

Current Version: **Oracle JDK 8**

# Installation

Pull the image from the docker index. This is the recommended method of installation as it is easier to update image. These builds are performed by the **Docker Trusted Build** service.

```bash
docker pull parana/jdk8-debian
```

You can also pull the `latest` tag which is built from the repository *HEAD*

```bash
docker pull parana/jdk8-debian:latest
```

Alternately you can build the image locally.

```bash
git clone https://github.com/joao-parana/jdk8-debian.git
cd jdk8-debian
docker build --tag="$USER/jdk8" .
```

# Quick Start

You can launch the image using the docker command line :

- **For test purpose :**

```bash
docker run --name='java8' -it --rm joao-parana/jdk8-debian:latest /bin/bash
```

- **For production purpose :**

This container is sort of base container. This means that you need create you own container with your Java application with base of this container (ie : FROM parana/jdk8-debian)
