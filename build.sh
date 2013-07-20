#!/bin/bash

cd $(dirname $0)

DIRTY="$DIRTY mineshafter/Future"
DIRTY="$DIRTY mineshafter/proxy/ModularProxy"
DIRTY="$DIRTY mineshafter/proxy/SocksProxyConnection"
DIRTY="$DIRTY mineshafter/proxy/UDPRelayServer"

[ -d bin ] || mkdir bin || exit
rm -rf bin/* || exit

javac \
    -source 6 -target 6 \
    -cp bin -d bin \
    $(find src -name '*.java') || exit

[ -d dist ] || mkdir dist || exit
rm -rf dist && cp -R proto-dist dist || exit

cd bin || exit
jar -uf \
    ../dist/Mineshafter-launcher.jar \
    $(for F in $DIRTY; do echo $F*.class; done)
