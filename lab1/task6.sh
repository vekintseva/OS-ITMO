#!/bin/bash

awk '$3 == "(WW)" {$3="Warning: "; print $0}' /var/log/anaconda/X.log > full.log
awk '$3 == "(II)" {$3="Information: "; print $0}' /var/log/anaconda/X.log >> full.log
cat full.log