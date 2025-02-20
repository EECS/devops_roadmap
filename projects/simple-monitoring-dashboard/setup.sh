#!/bin/bash

# Install netdata on a new system
curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh --dont-wait
