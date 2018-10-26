#!/bin/bash


docker run --privileged -v $PWD/../isar-build:/root/build -v $PWD:/root/isar -ti 3mdeb/isar
