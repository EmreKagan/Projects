########################
####  WELCOME###TO  #######
######  GUESS GAME  #######
#######################
        ##
        ##
        ##
        ##
        ##
        ##
        ##
##############################################################################################################################################
# Neccesary libraries
import random 
import time 
from math import sqrt 
import os 
import sys 
###############################################################################################################################################
# Method of the shut down.
# Used in, line(90,109,121)
def exiting():
    sys.exit(0)
    raise SystemExit
    os._exit(0)
    exit()
    quit()
##############################################################################################################################################
##############################################################################################################################################
# For gamemods, ssvalue calculator
# Used in, line(46,51,56,61,66,71)
def ssMultiple(value):
    return random.randint(int(sqrt(value)),value**2)
##############################################################################################################################################
##############################################################################################################################################
# For gamemods, tsvalue calculator
# Used in, line(47,52,57,62,67,72)
def tsMultiple(ssvalue):
    return random.randint(int(sqrt(ssvalue)),ssvalue**2)
##############################################################################################################################################
##############################################################################################################################################
## GAMEMODS
# Used in interFace() function line 125*
class modeZero():
    value = random.randint(0,10)
    ssvalue = ssMultiple(value)
    tsvalue = tsMultiple(ssvalue)
    
class modePeaceful():
    value = random.randint(0,100)
    ssvalue = ssMultiple(value)
    tsvalue = tsMultiple(ssvalue)
    
class modeRegular():
    value= random.randint(0,250)
    ssvalue = ssMultiple(value)
    tsvalue = tsMultiple(ssvalue)
    
class modeHard():
    value=random.randint(0,500)
    ssvalue = ssMultiple(value)
    tsvalue = tsMultiple(ssvalue)
    
class modeExtreme():
    value = random.randint(0,2000)
    ssvalue = ssMultiple(value)
    tsvalue = tsMultiple(ssvalue)
    
class modeImpossible():
    value= random.randint(0,10000)
    ssvalue = ssMultiple(value)
    tsvalue = tsMultiple(ssvalue)
##############################################################################################################################################   
##############################################################################################################################################
## Main game function.
# Used in, line()
health=10
def inGame(value):
    
    global health
    counter=0
    while health > 0:
        counter +=1
        health -=1
        # Controlling the input. It has to be an integer.
        try:
            guess = int(input("Enter a number: "))
            if guess == -1:
                print("Current game is cancelling...")
                time.sleep(2)
                exiting()
            
            elif guess == value:
                print(f"Congrat. You guessed right in {counter} try. Current health: {health}\n")
                time.sleep(3)
                break;
                
            elif guess < value:
                print(f"Your guess is less than the value. Current health: {health}\n")
                    
            else:
                print(f"Your guess is higher than the value. Current health: {health}\n")
                
        except ValueError:
            print("!!You've to enter a int data.!!")

    if health == 0:
            print(f"Game Over! Value was {value}. Game is closing in 3 secs...")
            time.sleep(3)
            exiting()
##############################################################################################################################################
##############################################################################################################################################           
# For pass the level, next level method.
# Used in interFace() function line 125*
def nexlvl(value):

    global health
    if health !=0:
        health=10
        # Print the new limits (root square and power 2..)
        print(f"Next level's number is between the {int(sqrt(value))}--{value**2}")
        
    else:
        exiting()
##############################################################################################################################################
##############################################################################################################################################              
## There is a interface for game. In there; we can choose the gamemods and play with inGame() and nextlvl() function.
class interFace():
    
    print("Welcome to the Guess Game")
    time.sleep(1)
    image ="""
    _______0____________________________0
    _______0____________________________0
    _______00__________________________00
    ________00_________________________00
    ________000_______________________00
    _________000_____________________00
    ___0______000_______00__00_____000_______0
    ___00_______000____0_0000_0____00_______00
    ____00_______000____000000____00_______00
    _____000______000__00000000___00_____000
    _______0000____00_0000000000_00____000
    _________000______0000000000_____0000
    ___________0000___0000000000___000
    ______________000__00000000__000
    _______________000_00000000_000
    _____________000_000000000000_000
    ___________000__00000000000000___000
    ________000____0000000000000000_____000
    _____000______00_000000000000_00______000
    ___00________00__000000000000__00_______000
    _000_______000___000000000000____00_______000
    00_______000______0000000000______000_______00
    00______000________00000000________000_______00
    _00_____00__________000000__________00_______00
    __00____000___________00____________00______00
    ___00____000_______________________00______00
    __________00______________________00
    ___________00____________________00
    ____________0___________________0
    
    Created by Spider IDE"""
    print(image)
    time.sleep(2)
    # Controlling the input. It has to be a character.
    try:
        difmod = input("""
    *********************************** 
    0-Zero Mode(z)--(0-10)            * 
    1-Peaceful Mode(p)--(0-100)       * 
    2-Regular Mode(r)--(0-250)        * 
    3-Hard Mode(h)--(0-500)           * 
    4-Extreme Mode(e)--(0-2000)       * 
    5-Impossible Mode(i)--(0-10000)   * 
                                      *  ****
    NOTE: If you wanna exit the game  *   **
    just enter '-1' for guess place   ******** 
                                             ** 
    GOOD LUCK :)                      *****  **
                                          *  **
    """)

    # In here, choosing the gamemods..
        if(difmod=="z"):
            print("Game is starting with zero mode(0-10)...")
            time.sleep(1)
            print("Level 1:")
            inGame(modeZero().value)
            nexlvl(modeZero().value)
            print("Level 2:")
            inGame(modeZero().ssvalue)
            nexlvl(modeZero().ssvalue)
            print("Level 3:")
            inGame(modeZero().tsvalue)
        
        elif(difmod=="p"):
            print("Game is starting with peaceful mode(0-100)...")
            time.sleep(1)
            print("Level 1:")
            inGame(modePeaceful().value)
            nexlvl(modePeaceful().value)
            print("Level 2:")
            inGame(modePeaceful().ssvalue)
            nexlvl(modePeaceful().ssvalue)
            print("Level 3:")
            inGame(modePeaceful().tsvalue)
        
        elif(difmod=="r"):
            print("Game is starting with regular mode(0-250)...")
            time.sleep(1)
            print("Level 1:")
            inGame(modeRegular().value)
            nexlvl(modeRegular().value)
            print("Level 2:")
            inGame(modeRegular().ssvalue)
            nexlvl(modeRegular().ssvalue)
            print("Level 3:")
            inGame(modeRegular().tsvalue)
        
        elif(difmod=="h"):
            print("Game is starting with hard mode(0-500)...")
            time.sleep(1)
            print("Level 1:")
            inGame(modeHard().value)
            nexlvl(modeHard().value)
            print("Level 2:")
            inGame(modeHard().ssvalue)
            nexlvl(modeHard().ssvalue)
            print("Level 3:")
            inGame(modeHard().tsvalue)

        elif(difmod=="e"):
            print("Game is starting with extreme mode(0-2000)...")
            time.sleep(1)
            print("Level 1:")
            inGame(modeExtreme().value)
            nexlvl(modeExtreme().value)
            print("Level 2:")
            inGame(modeExtreme().ssvalue)
            nexlvl(modeExtreme().ssvalue)
            print("Level 3:")
            inGame(modeExtreme().tsvalue)
        
        elif(difmod=="i"):
            print("Game is starting with impossible mode(0,10000)...")
            time.sleep(1)
            print("Level 1:")
            inGame(modeImpossible().value)
            nexlvl(modeImpossible().value)
            print("Level 2:")
            inGame(modeImpossible().ssvalue)
            nexlvl(modeImpossible().ssvalue)
            print("Level 3:")
            inGame(modeImpossible().tsvalue)
    except ValueError:
        print("!!You've to enter a char data.!!")
##############################################################################################################################################
##############################################################################################################################################  
## In here... we playing :)
interFace()
print("Game is ended.")
##############################################################################################################################################












































































































































































































































# Tihs cdoe wtreid by Emre Kagan Koksoy