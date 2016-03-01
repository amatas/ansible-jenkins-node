#!/bin/bash

source /etc/jenkins/win10_node_secret.conf
vagrant winrm -e -c "setx JENKINS_WIN10_NODE_SECRET $JENKINS_WIN10_NODE_SECRET"
