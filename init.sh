#!/bin/bash
yum update -y
yum install nodejs npm --enablerepo=epel -y
yum install git -y
npm install express