#!/bin/bash

# Run the jboss-cli commands for CORS
/opt/jboss/wildfly/bin/jboss-cli.sh -c <<EOF
/subsystem=undertow/configuration=filter/response-header="Access-Control-Allow-Origin":add(header-name="Access-Control-Allow-Origin",header-value="*")
/subsystem=undertow/configuration=filter/response-header="Access-Control-Allow-Methods":add(header-name="Access-Control-Allow-Methods",header-value="GET, POST, OPTIONS, PUT, DELETE")
/subsystem=undertow/configuration=filter/response-header="Access-Control-Allow-Headers":add(header-name="Access-Control-Allow-Headers",header-value="accept, authorization, content-type, x-requested-with")
/subsystem=undertow/configuration=filter/response-header="Access-Control-Allow-Credentials":add(header-name="Access-Control-Allow-Credentials",header-value="true")
/subsystem=undertow/configuration=filter/response-header="Access-Control-Max-Age":add(header-name="Access-Control-Max-Age",header-value="1")

/subsystem=undertow/server=default-server/host=default-host/filter-ref="Access-Control-Allow-Origin":add()
/subsystem=undertow/server=default-server/host=default-host/filter-ref="Access-Control-Allow-Methods":add()
/subsystem=undertow/server=default-server/host=default-host/filter-ref="Access-Control-Allow-Headers":add()
/subsystem=undertow/server=default-server/host=default-host/filter-ref="Access-Control-Allow-Credentials":add()
/subsystem=undertow/server=default-server/host=default-host/filter-ref="Access-Control-Max-Age":add()

# Exit CLI
exit
EOF
