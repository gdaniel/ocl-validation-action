#!/bin/bash

java -jar /ocl-cli.jar -M $GITHUB_WORKSPACE/$1 -m $GITHUB_WORKSPACE/$2 -c $GITHUB_WORKSPACE/$3
