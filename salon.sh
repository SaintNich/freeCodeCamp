#! /bin/bash

#variable to call for queries, ensures "tuples-only"
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\nSalon Service Scheduling\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo Hello. How may I help you?
  
  # Get services
  AVAIL_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
    
  # Display services
  echo "$AVAIL_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  
  # Ask which service
  echo -e "\nWhich service would you like?"
  read SERVICE_ID_SELECTED
  
  # if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # send to main menu
    MAIN_MENU "That is not a valid selection, please enter a number 1-3."
  else
    #check if service is listed
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
    
    #service not available
    if [[ -z $SERVICE_NAME ]]
    then
      MAIN_MENU "That service is not an option, please enter a number 1-3."
    else
      # get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
    
      #lookup customer by phone
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
      # if customer doesn't exist
      if [[ -z $CUSTOMER_NAME ]]
      then
        # get a new customer name
        echo -e "\nWhat is your name?"
        read CUSTOMER_NAME
      
        # insert new customer
        INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
        echo -e "\nThank you for registering, $CUSTOMER_NAME.\n\nWhat time would you like to schedule?"
        read SERVICE_TIME
      else
        echo -e "\nWelcome back,$CUSTOMER_NAME.\n\nWhat time would you like to schedule?"
        read SERVICE_TIME
      fi
      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
      # insert service
      INSERT_SERVICE_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    
      # get service
      SERVICE_INFO=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

      #end scheduling
      echo -e "\nI have put you down for a $(echo $SERVICE_INFO | sed -r 's/^ *| *$//') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    fi
fi
}

EXIT() {
  echo -e "\nThanks for visiting!"
}

MAIN_MENU
EXIT