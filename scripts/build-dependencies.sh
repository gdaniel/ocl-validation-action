#!/bin/bash

# Print a message
e() {
    echo -e "$1"
}

main() {
	
    echo $PATH

    mvn -version

	# Do not print the build log, it is already available in the Xatkit build
    e "Building Unpublished Dependencies"
    cd /tmp
    git clone https://github.com/unveiling/unveiling-commons.git
    cd unveiling-commons
    mvn clean install -DskipTests

    cd /tmp
    git clone https://github.com/gdaniel/ocl-tools.git
    cd /tmp/ocl-tools/eclipse
    mvn clean install -DskipTests
    
    cd /tmp/ocl-tools/cli
    mvn clean install -DskipTests

    cp target/ocl-cli.jar /ocl-cli.jar
}

main