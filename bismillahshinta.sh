#!/bin/bash 
main(){
m=`zenity --list --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --text "\t\t\t\t\tHOW SMART YOU ARE?" --column "THE BRAIN'S GAME" "Take the game" "Exit! I give up"`
if [ "$m" == "Take the game" ]; 
then
na
elif [ "$m" == "Exit! I give up" ] || [ "$?" == "1" ];
then
clear;
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Thanks for your trying" --timeout 10 
fi
}

loading(){ 

mplayer /home/lubuntu/Downloads/opening.mp4 

(
echo "20"; sleep 1 
echo "#Loading . . ."; 
echo "50"; sleep 1 
echo "#Loading . . ."; 
echo "100";
echo "#Loading . . .";
) | zenity --width 700 --height 700 --progress \
--title="WELCOME TO THE BRAIN'S GAME" \
--text="Loading . . ." \
--percentage=10 --timeout=2 
if [ "$?" == 1 ];
then 
clear;
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Thanks for yout trying" --timeout 10
Keluar 0; 
else
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME"--info --text="Are you ready to try the game?"
fi
}


na(){
nama=`zenity --width 700 --height 700 --entry --title "WELCOME TO THE BRAIN'S GAME" --text="Enter your name, please"` 
if (test -z $nama);
then 
wname 
main
else greet 
fi
}


wname(){
zenity --width 700 --height 700 --warning \
--width 700 --height 700 --text="No name entered or make sure to click ok button"
}


greet(){ 
(
echo "70" ; sleep 1
echo "100" ; sleep 1
echo "#Click ok" ; sleep 1
) |zenity --width 700 --height 700 --progress \
--width 700 --height 700 --title="WELCOME TO THE BRAIN'S GAME" \
--width 700 --height 700 --text="Please wait ..." \
--width 700 --height 700 --percentage=0 
if [ "$?" == 1 ];
then 
main 
else
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Hello $nama. Good luck for your trying!
RULES:
1. Complete the mission at each level
2. Each level has different challenge and reward. The higher the level, the faster the timeout available and the more score you can get
3. Do your best and see your best skors and scores as well" --timeout 10
game 
fi
}

skor(){
let totscore=$totar+$totnu+$tota+$total+$totco 
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "We'll see how smart you are" --timeout=4
echo ${nama// /_} $totscore >> dataskor.txt
awk '{{printf"%s\n",$1;printf"%s\n",$2;}}' dataskor.txt | zenity --width 700 --height 700 --list --title="WELCOME TO THE BRAIN'S GAME" --column="Nama" --column="Score"
game 
}

game(){
g=`zenity --width 700 --height 700 --list --title "UJI KATAK" --text "\t\t\t\t\tChallenge" --column "COMPLETE ALL MISSIONS" "Level 1: Arithmetic" "Level 2: Numbers" "Level 3: Mind-breaker" "Level 4: Alphabets" "Level 5: Colors" "Check scores you've got"`
if [ "$g" == "Level 1: Arithmetic" ]; 
then
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --question --text="Are you ready ?" 
if [ "$?" == 1 ];
then 
game 
else
aritmatika 
fi
elif [ "$g" == "Level 2: Numbers" ]; 
then
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --question --text="Are you ready ?" 
if [ "$?" == 1 ];
then 
game 
else 
numbers 
fi
elif [ "$g" == "Level 3: Mind-breaker" ]; 
then
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --question --text="Are you ready ?" 
if [ "$?" == 1 ];
then 
game 
else 
TTS
fi
elif [ "$g" == "Level 4: Alphabets" ]; 
then
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --question --text="Are you ready ?" 
if [ "$?" == 1 ];
then 
game 
else 
alphabets 
fi
elif [ "$g" == "Level 5: Colors" ]; 
then
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --question --text="Are you ready ?" 
if [ "$?" == 1 ];
then 
game
else 
color 
fi
elif [ "$g" == "Check scores you've got" ]; 
then
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --question --text="Are you curious?" 
if [ "$?" == 1 ];
then 
game
else 
skor
fi
elif [ "$g" == "Exit" ] || [ "$?" == "1" ]; 
then
main 
fi
}


aritmatika(){
ansar1=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "157 + 143 = ?" --radiolist --column "Choose" --column "Answer" TRUE 300 FALSE 200 FALSE 400 --timeout=5)
if [ "$?" == "1" ]; then 
let totar1=0;
game
elif [ "$?" == "0" ] || [ "$ansar1" == "300" ]; then 
let totar1=10;
elif [ "$?" == "0" ] || [ "$ansar1" != "300" ]; then 
let totar1=0;
fi


ansar2=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "22 x 24 = ?" --radiolist --column "Choose" --column "Answer" TRUE 628 FALSE 528 FALSE 428 --timeout=5)
if [ "$?" == "1" ]; then 
let totar2=0;
game
elif [ "$?" == "0" ] || [ "$ansar2" == "528" ]; then 
let totar2=10;
elif [ "$?" == "0" ] || [ "$ansar2" != "528" ]; then 
let totar2=0;
fi


ansar3=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "157 - 63 = ?" --radiolist --column "Choose" --column "Answer" TRUE 94 FALSE 104 FALSE 84 --timeout=5)
if [ "$?" == "1" ]; then 
let totar3=0;
game
elif [ "$?" == "0" ] || [ "$ansar3" == "94" ]; then 
let totar3=10;
elif [ "$?" == "0" ] || [ "$ansar3" != "94" ]; then 
let totar3=0;
fi


ansar4=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "1575 / 35 = ?" --radiolist --column "Choose" --column "Answer" TRUE 35 FALSE 45 FALSE 25 --timeout=5)
if [ "$?" == "1" ]; then 
let totar4=0;
game
elif [ "$?" == "0" ] || [ "$ansar4" == "45" ]; then 
let totar4=10;
elif [ "$?" == "0" ] || [ "$ansar4" != "45" ]; then 
let totar4=0;
fi


ansar5=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "22-12*10/5+58 = ?" --radiolist --column "Choose" --column "Answer" TRUE 60 FALSE 62 FALSE 70 --timeout=5) 
if [ "$?" == "1" ]; then
let totar5=0; 
game
elif [ "$?" == "0" ] || [ "$ansar5" == "60" ]; then 
let totar5=10;
elif [ "$?" == "0" ] || [ "$ansar5" != "60" ]; then
let totar5=0; 
fi

let totar=$totar1+$totar2+$totar3+$totar4+$totar5
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Hey $nama, your score in level 1 is $totar" --timeout 6
game
}

numbers(){
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Name : Susan\nPhone : 3337" --timeout=4
ansnu1=`zenity --width 700 --height 700 --entry --title "WELCOME TO THE BRAIN'S GAME" --text="What is Susan's Number ?"` 
if [ "$?" == "1" ]; then
game
elif [ "$?" == "0" ]||[ "$ansnu1" == "3337" ]; then 
let totnu1=20;
elif [ "$?" == "0" ]||[ "$ansnu1" != "3337" ]; then 
let totnu1=0;
elif (test -z $ansnu1); then 
let totnu1=0;
fi


zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Name : Zuyina\nPhone : 1996" --timeout=4
ansnu2=`zenity --width 700 --height 700 --entry --title "WELCOME TO THE BRAIN'S GAME" --text="What is Zuyina's Number ?"`
if [ "$?" == "1" ]; then 
game
elif [ "$?" == "0" ]||[ "$ansnu2" == "1996" ]; then 
let totnu2=20;
elif [ "$?" == "0" ]||[ "$ansnu2" != "1996" ]; then 
let totnu2=0;
elif (test -z $ansnu2); then 
let totnu2=0;
fi

zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Name : Linda son\nPhone : 7789\n\nName : James Delon\nPhone : 9989" --timeout=4
ansnu3=`zenity --width 700 --height 700 --entry --title "UJI KATAK" --text="What is James Delon's Number ?"`
if [ "$?" == "1" ]; then 
game
elif [ "$?" == "0" ]||[ "$ansnu3" == "9989" ]; then 
let totnu3=20;
elif [ "$?" == "0" ]||[ "$ansnu3" != "9989" ]; then 
let totnu3=0;
elif (test -z $ansnu3); then 
let totnu3=0;
fi


zenity --width 700 --height 700 --title "THE BRAINS'S GAME" --info --text "Name : Justin Bieber\nPhone : 83644\n\nName : Selena Gomez\nPhone : 64483" --timeout=4
ansnu4=`zenity --width 700 --height 700 --entry --title "WELCOME TO THE BRAIN'S GAME" --text="What is Justin Biebe's Number ?"`
if [ "$?" == "1" ]; then 
game
elif [ "$?" == "0" ]||[ "$ansnu4" == "83644" ]; then 
let totnu4=20;
elif [ "$?" == "0" ]||[ "$ansnu4" != "83644" ]; then 
let totnu4=0;
elif (test -z $ansnu4); then 
lettotnu4=0;
fi

zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Name : John Smith\nPhone : 7789768\n\nName : Selena Gomeze\nPhone : 64483\n\nName : James Robinson\nPhone : 8254" --timeout=4
ansnu5=`zenity --width 700 --height 700 --entry --title "WELCOME TO THE BRAIN'S GAME" --text="What is John Smith's Number ?"`
if [ "$?" == "1" ]; then 
game
elif [ "$?" == "0" ]||[ "$ansnu5" == "7789768" ]; then 
let totnu5=20;
elif [ "$?" == "0" ]||[ "$ansnu5" != "7789768" ]; then 
let totnu5=0;
elif (test -z $ansnu5); then 
let totnu5=0;
fi


let totnu=$totnu1+$totnu2+$totnu3+$totnu4+$totnu5
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Hey $nama, your score in level 2 is $totnu" --timeout 6 
game
}


TTS(){
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Berbaris bukan tentara, Meletus bukan balon." --timeout=3
asu1=`zenity --width 700 --height 700 --entry --title "UJI KATAK" --text="Your answer is"` 
if [ "$?" == "1" ]; then
game
elif [ "$?" == "0" ]||[ "$asu1" == "jagung bakar" ]; then 
let tota1=30;
elif [ "$?" == "0" ]||[ "$asu1" != "jagung bakar" ]; then 
let tota1=0;
elif (test -z $asu1); then 
let tota1=0;
fi


zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Diucapkan 1 kali Jauh, diucapkan 2 kali jadi deket." --timeout=3
asu2=`zenity --width 700 --height 700 --entry --title "WELCOME TO THE BRAIN'S GAME" --text="Your answer is"` 
if [ "$?" == "1" ]; then
game
elif [ "$?" == "0" ]||[ "$asu2" == "langit langit" ]; then 
let tota2=30;
elif [ "$?" == "0" ]||[ "$asu2" != "langit langit" ]; then 
let tota2=0;
elif (test -z $asu2); then 
let tota2=0;
fi


zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Jatuhnya ke bawah lihatnya ke atas." --timeout=3
asu3=`zenity --width 700 --height 700 --entry --title "WELCOME TO THE BRAIN'S GAME" --text="Your answer is"` 
if [ "$?" == "1" ]; then
game
elif [ "$?" == "0" ]||[ "$asu3" == "genting bocor" ]; then 
let tota3=30;
elif [ "$?" == "0" ]||[ "$asu3" != "genting bocor" ]; then 
let tota3=0;
elif (test -z $asu3); then 
let tota3=0;
fi


zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Ujung satu basah, ujung yang lain terbakar." --timeout=3
asu4=`zenity --width 700 --height 700 --entry --title "WELCOME TO THE BRAIN'S GAME" --text="Your answer is"` 
if [ "$?" == "1" ]; then
game
elif [ "$?" == "0" ]||[ "$asu4" == "sumbu kompor" ]; then 
let tota4=30;
elif [ "$?" == "0" ]||[ "$asu4" != "sumbu kompor" ]; then 
let tota4=0;
elif (test -z $asu4); then 
let tota4=0;
fi


zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Dipotong semakin panjang." --timeout=3
asu5=`zenity --width 700 --height 700 --entry --title "WELCOME TO THE BRAIN'S GAME" --text="Your answer is"` 
if [ "$?" == "1" ]; then
game
elif [ "$?" == "0" ]||[ "$asu5" == "gelang karet" ]; then 
let tota5=30;
elif [ "$?" == "0" ]||[ "$asu5" != "gelang karet" ]; then 
let tota5=0;
elif (test -z $asu5); then 
let tota5=0;
fi


let tota=$tota1+$tota2+$tota3+$tota4+$tota5
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Hey $nama, your score in level 3 is $tota" --timeout 6
game
}


alphabets(){
ansal1=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "GHKIUYTRE" --radiolist --column "Choose" --column "Answer" TRUE 10 FALSE 8 FALSE 9 --timeout=2)
if [ "$?" == "1" ]; then
game
elif [ "$?" == "0" ]||[ "$ansal1" == "9" ]; then 
let total1=40;
elif [ "$?" == "0" ]||[ "$ansal1" != "9" ]; then 
let total1=0;
fi


ansal2=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "UOPLKMNJUYTRGT" --radiolist --column "Choose" --column "Answer" TRUE 14 FALSE 12 FALSE 13 --timeout=2) 
if [ "$?" == "1" ]; then
game
elif [ "$?" == "0" ]||[ "$ansal2" == "14" ]; then 
let total2=40;
elif [ "$?" == "0" ]||[ "$ansal2" != "14" ]; then 
let total2=0;
fi


ansal3=$(zenity --width 700 --height 700 --title "UJI KATAK" --list --text "GHUOKLPKMYTREWQA" --radiolist --column "Choose" --column "Answer" TRUE 17 FALSE 15 FALSE 9 --timeout=2)
if [ "$?" == "1" ]; then 
game
elif [ "$?" == "0" ]||[ "$ansal3" == "15" ]; then 
let total3=40;
elif [ "$?" == "0" ]||[ "$ansal3" != "15" ]; then 
let total3=0;
fi


ansal4=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "HHUUKKMMMFFTTTTR" --radiolist --column "Choose" --column "Answer" TRUE 17 FALSE 16 FALSE 15 --timeout=2)
if [ "$?" == "1" ]; then 
game
elif [ "$?" == "0" ]||[ "$ansal4" == "16" ]; then 
let total4=40;
elif [ "$?" == "0" ]||[ "$ansal4" != "16" ]; then 
let total4=0;
fi


ansal5=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "AAAAAADDDDFFFFTTTT" --radiolist --column "Choose" --column "Answer" TRUE 16 FALSE 15 FALSE 18 --timeout=2)
if [ "$?" == "1" ]; then 
game
elif [ "$?" == "0" ]||[ "$ansal5" == "18" ]; then 
let total5=40;
elif [ "$?" == "0" ]||[ "$ansal5" != "18" ]; then 
let total5=0;
fi


let total=$total1+$total2+$total3+$total4+$total5
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Hey $nama, your score in level 4 is $total" --timeout 6
game
}


color(){
clear; 
#!bin/bash
hitam="\033[40m \033[0m" 
merah="\033[41m \033[0m" 
hijau="\033[42m \033[0m" 
kuning="\033[43m \033[0m" 
biru="\033[44m \033[0m" 
magenta="\033[45m \033[0m" 
cyan="\033[46m \033[0m"


echo ""
echo "Number 1" 
echo ""
for z in 1 2 3 4 5 6 
do
echo -ne "$hitam" 
done
echo -n " = "
for z in 1 2 3 4 5 6 
do
echo -ne "$merah" 
done
echo -n " "
for z in 1 2 3 4 5 6 
do
echo -ne "$hijau" 
done
echo -n " = "
for z in 1 2 3 4 5 6 
do
echo -ne "$kuning" 
done
echo ""
echo "----------------------------------"
printf "\t"
for z in 1 2 3 4 5 6 7 8 9 
do
echo -ne "$kuning" 
done
echo -n " = ?"
echo ""
echo ""
echo "Choose the answer number 1" 
echo ""
echo -n "a. "
for z in 1 2 3 4 5 6 
do
echo -ne "$merah" 
done
echo ""
echo ""
echo -n "b. "
for z in 1 2 3 4 5 6 
do
echo -ne "$hijau" 
done
echo ""
echo ""
echo -n "c."
for z in 1 2 3 4 5 6 
do
echo -ne "$hitam" 
done
echo ""
echo ""
ansco1=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "Number 1" --radiolist --column "Choose" --column "Answer" TRUE a FALSE b FALSE c --timeout=1)
if [ "$?" == "1" ]; then 
clear;
game
elif [ "$?" == "0" ]||[ "$ansco1" == "b" ]; then
let totco1=50;
elif [ "$?" == "0" ]||[ "$ansco1" != "b" ]; then 
let totco1=0;
fi


clear; 
#!bin/bash

#b
echo -e "\033[42m \033[2;1H \033[0m" 
echo -e "\033[42m \033[3;1H \033[0m" 
echo -e "\033[42m \033[4;1H \033[0m" 
echo -e "\033[42m \033[5;1H \033[0m" 
echo -e "\033[42m \033[6;1H\033[0m"

echo -e "\033[42m \033[4;2H \033[0m" 
echo -e "\033[42m \033[4;3H \033[0m" 
echo -e "\033[42m \033[4;4H \033[0m" 
echo -e "\033[42m \033[4;5H \033[0m" 
echo -e "\033[42m \033[4;6H \033[0m" 
echo -e "\033[42m \033[4;7H\033[0m"

echo -e "\033[42m \033[5;7H\033[0m"


echo -e "\033[42m \033[6;2H \033[0m" 
echo -e "\033[42m \033[6;3H \033[0m" 
echo -e "\033[42m \033[6;4H \033[0m" 
echo -e "\033[42m \033[6;5H \033[0m" 
echo -e "\033[42m \033[6;6H \033[0m" 
echo -e "\033[42m \033[6;7H\033[0m"



#i
echo -e "\033[42m \033[2;9H\033[0m"


echo -e "\033[42m \033[4;9H \033[0m" 
echo -e "\033[42m \033[5;9H \033[0m" 
echo -e "\033[42m \033[6;9H\033[0m"



#r
echo -e "\033[42m \033[3;11H \033[0m" 
echo -e "\033[42m \033[3;12H \033[0m" 
echo -e "\033[42m \033[3;13H \033[0m" 
echo -e "\033[42m \033[3;14H \033[0m" 
echo -e "\033[42m \033[3;15H \033[0m" 
echo -e "\033[42m \033[3;16H \033[0m" 
echo -e "\033[42m \033[3;17H\033[0m"

echo -e "\033[42m \033[3;11H \033[0m" 
echo -e "\033[42m \033[4;11H \033[0m" 
echo -e "\033[42m \033[5;11H \033[0m" 
echo -e "\033[42m \033[6;11H\033[0m"



#u
echo -e "\033[42m \033[3;19H \033[0m" 
echo -e "\033[42m \033[4;19H \033[0m" 
echo -e "\033[42m \033[5;19H \033[0m" 
echo -e "\033[42m \033[6;19H\033[0m"

echo -e "\033[42m \033[6;20H\033[0m"

echo -e "\033[42m \033[6;21H \033[0m" 
echo -e "\033[42m \033[6;22H \033[0m" 
echo -e "\033[42m \033[6;23H\033[0m"


echo -e "\033[42m \033[3;24H \033[0m" 
echo -e "\033[42m \033[4;24H \033[0m" 
echo -e "\033[42m \033[5;24H \033[0m" 
echo -e "\033[42m \033[6;24H\033[0m"

ansco2=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "Number 2: Read the Color" --radiolist --column "Choose" --column "Answer" TRUE Merah FALSE Biru FALSE Hijau --timeout=1)
if [ "$?" == "1" ]; then 
clear;
game
elif [ "$?" == "0" ]||[ "$ansco2" == "Hijau" ]; then 
let totco2=50;
elif [ "$?" == "0" ]||[ "$ansco2" != "Hijau" ]; then 
let totco2=0;
fi


clear; 
#!bin/bash
hitam="\033[40m \033[0m" 
merah="\033[41m \033[0m" 
hijau="\033[42m \033[0m" 
kuning="\033[43m \033[0m"
biru="\033[44m \033[0m" 
magenta="\033[45m \033[0m" 
cyan="\033[46m \033[0m"

echo ""

echo "Number 3" 
echo ""
for z in 1 2 3 4 5 6 
do
echo -ne "$merah" 
done
echo -n " = "
for z in 1 2 3 4 5 6 
do
echo -ne "$hijau" 
done
echo -n " "
for z in 1 2 3 4 5 6 
do
echo -ne "$kuning" 
done
echo -n " = "
for z in 1 2 3 4 5 6 
do
echo -ne "$biru" 
done
echo ""
echo "----------------------------------"
printf "\t "
for z in 1 2 3 4 5 6 7 8 9 
do
echo -ne "$merah" 
done
echo -n " = ?" 
echo ""
echo ""

echo "Choose the answer number 3" 
echo ""
echo -n "a. "
for z in 1 2 3 4 5 6 
do
echo -ne "$hijau" 
done
echo ""
echo ""
echo -n "b. "
for z in 1 2 3 4 5 6 
do
echo -ne "$biru" 
done
echo ""
echo ""
echo -n "c. "
for z in 1 2 3 4 5 6 
do
echo -ne "$kuning" 
done
echo ""
echo ""
ansco3=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "Number 3" --radiolist --column "Choose" --column "Answer" TRUE a FALSE b FALSE c --timeout=1)
if [ "$?" == "1" ]; then 
clear;
game
elif [ "$?" == "0" ]||[ "$ansco3" == "a" ]; then 
let totco3=50;
elif [ "$?" == "0" ]||[ "$ansco3" != "a" ]; then
let totco3=0; 
fi

clear; 
#!bin/bash

#m
echo -e "\033[44m \033[2;1H \033[0m" 
echo -e "\033[44m \033[2;2H \033[0m" 
echo -e "\033[44m \033[2;3H \033[0m" 
echo -e "\033[44m \033[2;4H \033[0m" 
echo -e "\033[44m \033[2;5H \033[0m" 
echo -e "\033[44m \033[2;6H \033[0m" 
echo -e "\033[44m \033[2;7H \033[0m" 
echo -e "\033[44m \033[2;8H \033[0m" 
echo -e "\033[44m \033[2;9H \033[0m" 
echo -e "\033[44m \033[2;10H \033[0m" 
echo -e "\033[44m \033[2;11H \033[0m" 
echo -e "\033[44m \033[2;12H \033[0m" 
echo -e "\033[44m \033[2;13H \033[0m" 
echo -e "\033[44m \033[2;14H \033[0m"

echo -e "\033[44m \033[3;1H \033[0m" 
echo -e "\033[44m \033[4;1H \033[0m" 
echo -e "\033[44m \033[5;1H \033[0m" 
echo -e "\033[44m \033[6;1H\033[0m"

echo -e "\033[44m \033[2;7H \033[0m" 
echo -e "\033[44m \033[3;7H \033[0m" 
echo -e "\033[44m \033[4;7H \033[0m" 
echo -e "\033[44m \033[5;7H\033[0m"

echo -e "\033[44m \033[6;7H \033[0m"



echo -e "\033[44m \033[2;14H \033[0m" 
echo -e "\033[44m \033[3;14H \033[0m" 
echo -e "\033[44m \033[4;14H \033[0m" 
echo -e "\033[44m \033[5;14H \033[0m" 
echo -e "\033[44m \033[6;14H \033[0m"



#e
echo -e "\033[44m \033[2;16H \033[0m" 
echo -e "\033[44m \033[2;17H \033[0m" 
echo -e "\033[44m \033[2;18H \033[0m" 
echo -e "\033[44m \033[2;19H \033[0m" 
echo -e "\033[44m \033[2;20H \033[0m" 
echo -e "\033[44m \033[2;21H \033[0m" 
echo -e "\033[44m \033[2;22H\033[0m"

echo -e "\033[44m \033[3;22H\033[0m"


echo -e "\033[44m \033[4;16H \033[0m" 
echo -e "\033[44m \033[4;17H \033[0m" 
echo -e "\033[44m \033[4;18H \033[0m" 
echo -e "\033[44m \033[4;19H \033[0m" 
echo -e "\033[44m \033[4;20H \033[0m" 
echo -e "\033[44m \033[4;21H \033[0m" 
echo -e "\033[44m \033[4;22H\033[0m"

echo -e "\033[44m \033[6;16H \033[0m" 
echo -e "\033[44m \033[6;17H\033[0m"

echo -e "\033[44m \033[6;18H \033[0m" 
echo -e "\033[44m \033[6;19H \033[0m" 
echo -e "\033[44m \033[6;20H \033[0m" 
echo -e "\033[44m \033[6;21H \033[0m" 
echo -e "\033[44m \033[6;22H\033[0m"

echo -e "\033[44m \033[3;16H \033[0m" 
echo -e "\033[44m \033[4;16H \033[0m" 
echo -e "\033[44m \033[5;16H \033[0m" 
echo -e "\033[44m \033[6;16H\033[0m"



#r
echo -e "\033[44m \033[2;24H \033[0m" 
echo -e "\033[44m \033[2;25H \033[0m" 
echo -e "\033[44m \033[2;26H \033[0m" 
echo -e "\033[44m \033[2;27H \033[0m" 
echo -e "\033[44m \033[2;28H \033[0m" 
echo -e "\033[44m \033[2;29H \033[0m" 
echo -e "\033[44m \033[2;30H\033[0m"

echo -e "\033[44m \033[3;24H \033[0m" 
echo -e "\033[44m \033[4;24H \033[0m" 
echo -e "\033[44m \033[5;24H \033[0m" 
echo -e "\033[44m \033[6;24H\033[0m"



#a
echo -e "\033[44m \033[2;32H \033[0m" 
echo -e "\033[44m \033[2;33H \033[0m" 
echo -e "\033[44m \033[2;34H \033[0m"

echo -e "\033[44m \033[2;35H \033[0m" 
echo -e "\033[44m \033[2;36H \033[0m" 
echo -e "\033[44m \033[2;37H \033[0m" 
echo -e "\033[44m \033[2;38H \033[0m" 
echo -e "\033[44m \033[3;38H\033[0m"

echo -e "\033[44m \033[4;32H \033[0m" 
echo -e "\033[44m \033[4;33H \033[0m" 
echo -e "\033[44m \033[4;34H \033[0m" 
echo -e "\033[44m \033[4;35H \033[0m" 
echo -e "\033[44m \033[4;36H \033[0m" 
echo -e "\033[44m \033[4;37H \033[0m" 
echo -e "\033[44m \033[4;38H\033[0m"

echo -e "\033[44m \033[5;32H \033[0m" 
echo -e "\033[44m \033[5;38H\033[0m"

echo -e "\033[44m \033[6;32H \033[0m" 
echo -e "\033[44m \033[6;33H \033[0m" 
echo -e "\033[44m \033[6;34H \033[0m" 
echo -e "\033[44m \033[6;35H \033[0m" 
echo -e "\033[44m \033[6;36H \033[0m" 
echo -e "\033[44m \033[6;37H \033[0m" 
echo -e "\033[44m \033[6;38H\033[0m"

#h
echo -e "\033[44m \033[4;40H \033[0m" 
echo -e "\033[44m \033[4;41H \033[0m" 
echo -e "\033[44m \033[4;42H \033[0m" 
echo -e "\033[44m \033[4;43H \033[0m" 
echo -e "\033[44m \033[4;44H \033[0m"

echo -e "\033[44m \033[4;45H \033[0m" 
echo -e "\033[44m \033[4;46H\033[0m"

echo -e "\033[44m \033[2;40H \033[0m" 
echo -e "\033[44m \033[3;40H \033[0m" 
echo -e "\033[44m \033[4;40H \033[0m" 
echo -e "\033[44m \033[5;40H \033[0m" 
echo -e "\033[44m \033[6;40H\033[0m"

echo -e "\033[44m \033[2;46H \033[0m" 
echo -e "\033[44m \033[3;46H \033[0m" 
echo -e "\033[44m \033[4;46H \033[0m" 
echo -e "\033[44m \033[5;46H \033[0m" 
echo -e "\033[44m \033[6;46H\033[0m"
ansco4=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "Number 4: Read the Color" --radiolist --column "Choose" --column "Answer" TRUE Merah FALSE Biru FALSE Ungu --timeout=1)
if [ "$?" == "1" ]; then 
clear;
game
elif [ "$?" == "0" ]||[ "$ansco4" == "Biru" ]; then 
let totco4=50;
elif [ "$?" == "0" ]||[ "$ansco4" != "Biru" ]; then 
let totco4=0;
fi


clear; 
#!bin/bash
hitam="\033[40m \033[0m" 
merah="\033[41m \033[0m" 
hijau="\033[42m \033[0m" 
kuning="\033[43m \033[0m"
biru="\033[44m \033[0m" 
magenta="\033[45m \033[0m" 
cyan="\033[46m \033[0m"

echo ""
echo "Number 5" 
echo ""
for z in 1 2 3 4 5 6 
do
echo -ne "$kuning" 
done
echo -n " = "
for z in 1 2 3 4 5 6 
do
echo -ne "$biru" 
done
echo -n " "
for z in 1 2 3 4 5 6 
do
echo -ne "$magenta" 
done
echo -n " = "
for z in 1 2 3 4 5 6 
do
echo -ne "$cyan" 
done
echo ""
echo "----------------------------------"
printf "\t"
for z in 1 2 3 4 5 6 7 8 9 
do
echo -ne "$biru" 
done
echo -n " = ?" 
echo ""
echo ""
echo "Choose the answer number 2" 
echo ""
echo -n "a. "
for z in 1 2 3 4 5 6 
do
echo -ne "$magenta" 
done
echo ""
echo ""
echo -n "b. "
for z in 1 2 3 4 5 6 
do
echo -ne "$cyan" 
done
echo ""
echo ""
echo -n "c."
for z in 1 2 3 4 5 6 
do
echo -ne "$kuning" 
done
echo ""
echo ""
ansco5=$(zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --list --text "Number 5" --radiolist --column "Choose" --column "Answer" TRUE a FALSE b FALSE c --timeout=1)
if [ "$?" == "1" ]; then
clear; 
game
elif [ "$?" == "0" ]||[ "$ansco5" == "c" ]; then 
let totco5=50;
elif [ "$?" == "0" ]||[ "$ansco5" != "c" ]; then 
let totco5=0;
fi


let totco=$totco1+$totco2+$totco3+$totco4+$totco5 
zenity --width 700 --height 700 --title "WELCOME TO THE BRAIN'S GAME" --info --text "Hey $nama, your score in level 5 is $totco" --timeout 6 
clear;
game
}

loading 
main

