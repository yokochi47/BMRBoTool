#!/bin/bash

if [ -e VERSION ] ; then
 BMRBX_TOOL_HOME=../bmrbx-tool-`cat VERSION` # Please edit me.
elif [ -e ../VERSION ] ; then
 BMRBX_TOOL_HOME=../bmrbx-tool-`cat ../VERSION` # Please edit me.
fi

