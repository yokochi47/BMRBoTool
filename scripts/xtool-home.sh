#!/bin/bash

if [ -d ../BMRBxTool ] || [ -d ../../BMRBxTool ] ; then
 BMRBX_TOOL_HOME=../BMRBxTool
elif [ -e VERSION ] ; then
 BMRBX_TOOL_HOME=../bmrbx-tool-`cat VERSION` # Please edit me.
elif [ -e ../VERSION ] ; then
 BMRBX_TOOL_HOME=../bmrbx-tool-`cat ../VERSION` # Please edit me.
fi

