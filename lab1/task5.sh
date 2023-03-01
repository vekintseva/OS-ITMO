#!/bin/bash

awk '$2 == "INFO" {print $0}' /var/log/anaconda/syslog > lab1/info.log

#awk - утилита контекстного поиска

