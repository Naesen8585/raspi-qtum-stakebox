#!/bin/bash

sudo apt-get update
qtumd -daemon=1 -maxconnections=24 -rpcallowip=0.0.0.0/0 -rpcbind=127.0.0.1 -server -rpcport=3889 -onlynet=ipv4
