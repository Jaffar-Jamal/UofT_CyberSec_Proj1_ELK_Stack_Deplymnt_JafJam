#!/bin/bash

cat 0315_Dealer_schedule | grep 05:00:00 | grep AM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 08:00:00 | grep AM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 02:00:00 | grep PM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 08:00:00 | grep PM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 11:00:00 | grep PM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 05:00:00 | grep AM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 08:00:00 | grep AM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 02:00:00 | grep PM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 08:00:00 | grep PM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 11:00:00 | grep PM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 05:00:00 | grep AM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 08:00:00 | grep AM | awk -F " " '{print $1, $2, $5, $6}'
cat 0315_Dealer_schedule | grep 02:00:00 | grep PM | awk -F " " '{print $1, $2, $5, $6}'

