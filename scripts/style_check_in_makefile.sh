#!/bin/bash
# -*- coding: latin-1 -*-
# Copyright 2016 Telefonica Investigacion y Desarrollo, S.A.U
#
# This file is part of Orion Context Broker.
#
# Orion Context Broker is free software: you can redistribute it and/or
# modify it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# Orion Context Broker is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero
# General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Orion Context Broker. If not, see http://www.gnu.org/licenses/.
#
# For those usages not covered by this license please contact with
# iot_support at tid dot es
#
# Author: Ken Zangelin

# NOTE: this script is designed to be launched from makefile targets. Thus,
# the call to style_check.sh may break if you attempt to use it from a
# different place. 


# -----------------------------------------------------------------------------
#
# style_check
#
function style_check
{
  scripts/style_check.sh -d "$1"
  if [ "$?" != 0 ]
  then
    echo Lint Errors:
    cat LINT_ERRORS
    echo "================================================================="
    cat LINT | grep -v "Done processing"
    echo 
    exit 1
  fi
}

style_check src/lib/serviceRoutinesV2
style_check src/lib/logSummary
style_check src/lib/jsonParseV2
style_check src/lib/apiTypesV2
style_check src/lib/mongoBackend
style_check src/lib/logMsg
style_check src/lib/parseArgs
style_check src/lib/cache
style_check src/lib/alarmMgr
style_check src/lib/metricsMgr
style_check test/unittests
style_check test/unittests/orionTypes
style_check test/unittests/jsonParse
style_check test/unittests/apiTypesV2
style_check test/unittests/cache
style_check test/unittests/mongoBackend

# FIXME: Just keep adding directories here until all of them are included:

# style_check src/lib/common
# style_check src/lib/convenience
# style_check src/lib/jsonParse
# style_check src/lib/ngsi
# style_check src/lib/ngsi10
# style_check src/lib/ngsi9
# style_check src/lib/ngsiNotify
# style_check src/lib/orionTypes
# style_check src/lib/parse
# style_check src/lib/rest
# style_check src/lib/serviceRoutines
# style_check src/app/contextBroker

# style_check test/unittests/common
# style_check test/unittests/convenience
# style_check test/unittests/ngsi
# style_check test/unittests/ngsi10
# style_check test/unittests/ngsi9
# style_check test/unittests/parse
# style_check test/unittests/rest
# style_check test/unittest/serviceRoutines