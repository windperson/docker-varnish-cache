#!/bin/bash

set -x
exec bash -c \
 "exec varnishd -F -f $VCL_CONFIG -s malloc,$CACHE_SIZE $VARNISHED_PARAMS"
