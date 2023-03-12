#!/bin/bash
randomNumber=$(shuf -i 1-6 -n 1)

echo $randomNumber

until [ $randomNumber -eq 0 ]
do
echo $randomNumber
let "randomNumber-=1" 
done
