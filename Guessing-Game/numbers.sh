#!/bin/bash

scorefile="highscores.txt"
guess=-1
typeset -i num=0

echo -e "\e[36mGuess a number between 1 and 100\e[0m\n"

(( answer = RANDOM % 100 + 1 ))

while (( guess != answer )); do
num=num+1
read -p "Enter guess $num: " guess

if [ -z "$guess" ]; then echo -e "\e[31mYour guess shouldn't be empty\e[0m";
elif ! [[ "$guess" =~ ^[0-9]+$ ]]; then echo -e "\e[31mYou should enter a number\e[0m";
elif (( guess < answer )); then echo -e "\e[36mHigher...\e[0m";
elif (( guess > answer )); then echo -e "\e[36mLower...\e[0m"; fi;
done;

echo -e "\e[32mCorrect! That took $num guesses.\e[0m\n"

check_for_name() {
    read -p "Please enter your name: " name
    if [ -z "$name" ]; then echo -e "\e[31mYour name shouldn't be empty\e[0m"; check_for_name; else echo $name $num >> $scorefile; fi;
}

check_for_name

echo -e "\n\e[36mPrevious high scores: \e[0m" 
cat $scorefile