#!/bin/bash

cat $1_Dealer_schedule| awk -F" " '{print $1, $2, $5, $6, " Game: Roulette"}' | grep $2.*$3
