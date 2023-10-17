#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_game -t --no-align --tuples-only -c"

#Generate random number from 1 to 1000
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

#Ask for username
echo -e "\nEnter your username:"
read USERNAME
USERNAME_RESULT=$($PSQL "SELECT username FROM number_game WHERE username='$USERNAME'")

#If username not found
if [[ -z $USERNAME_RESULT ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_NAME=$($PSQL "INSERT INTO number_game(username) VALUES('$USERNAME')")
else
  #Determine number of games played
  GAMES_PLAYED=$($PSQL "SELECT COUNT(username) FROM number_game WHERE username='$USERNAME'")
  #Determine best game played
  BEST_GAME=$($PSQL "SELECT MIN(games_played) FROM number_game WHERE username='$USERNAME'")
  #Welcome back message
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  INSERT_NAME=$($PSQL "INSERT INTO number_game(username) VALUES('$USERNAME')")
fi

#First number guess
echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS_NUMBER
#Declare the counter
NUMBER_OF_GUESSES=0

#Number tests
NUMBER_TEST () {
  #Not an integer
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    let NUMBER_OF_GUESSES=NUMBER_OF_GUESSES+1
    read GUESS_NUMBER
    NUMBER_TEST
  elif [[ $SECRET_NUMBER < $GUESS_NUMBER ]]
  then 
    #Lower
    echo -e "\nIt's lower than that, guess again:"
    let NUMBER_OF_GUESSES=NUMBER_OF_GUESSES+1
    read GUESS_NUMBER
    NUMBER_TEST
  elif [[ $SECRET_NUMBER > $GUESS_NUMBER ]]
  then
    #Higher
    echo -e "\nIt's higher than that, guess again:"
    let NUMBER_OF_GUESSES=NUMBER_OF_GUESSES+1
    read GUESS_NUMBER
    NUMBER_TEST
  else
    let NUMBER_OF_GUESSES=NUMBER_OF_GUESSES+1
    MAX_GAMEID=$($PSQL "SELECT MAX(game_id) FROM number_game WHERE username='$USERNAME'")
    COUNT=$($PSQL "UPDATE number_game SET games_played=$NUMBER_OF_GUESSES WHERE username='$USERNAME' AND game_id=$MAX_GAMEID")
    echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  fi
}

NUMBER_TEST