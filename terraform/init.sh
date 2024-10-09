#!/bin/bash
yum update -y
yum install git -y
yum install docker -y
systemctl start docker