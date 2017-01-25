#!/bin/bash
mysql neutron < cleanupneutrondb.sql
mysql octavia < cleanupoctaviadb.sql
