#!/bin/bash

echo "Please enter MMDD HH ##(AM/PM):"

cat $1_Dealer_schedule | grep $2.*$3 |awk '{print $1, $2, $5, $6}' 
