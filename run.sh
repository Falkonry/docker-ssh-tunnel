#!/bin/sh
# create a direct kube tunnel to service in another cluster


if [ -z ${NAMESPACE+x} ]; then
    NAMESPACE="falkonry"
fi

if [ -z ${DEPLOYMENT+x} ]; then
    DEPLOYMENT="cost-analyzer"
fi

if  [ -z ${FWD_PORT+x} ] ; then
    FWD_PORT="9091"
fi

if [ -z ${NAMESPACE+x} ] || [ -z ${DEPLOYMENT+x} ] || [ -z ${FWD_PORT+x} ] ] ; then 
    echo "some vars are not set"; 
    exit 1
fi

echo "starting kube proxy"

nohup kubectl port-forward -n $NAMESPACE deploy/$DEPLOYMENT $FWD_PORT:9090 &! 
