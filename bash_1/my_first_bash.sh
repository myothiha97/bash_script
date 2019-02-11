#!/bin/bash
#This is the script for testing case condtion
#Read command is use to ask input from user!!
#e.g read variable_name
echo "Hello , What's your name ?"
read your_name
to_exit="quit"
_word=" Thanks you for using my script $your_name.If u want to quit the process Write a exact word 'quit' "


#now ask user which value he/she want to use in {1 - 8, 8 - 8.4 }
echo "Welcome $your_name. Write anynumber  between 1 to 7 to check system information and  8 to 8.4 for performing user operation "
read userC

#Depend on the value he chose we will return following command !!
while [ $userC -le 1000 ]
do
case $userC in
	1)
		input1= sudo cat /etc/os-release
	       	echo $input1
		echo $_word
		read _exit
		case $_exit in 
			quit)
				exit
				;;
			*)
			while [ $_exit != $to_exit ]
			do
	echo "Invalid word!! Please write exact word  quit"
			read _exit
	      		done
			exit
			;;
			esac
		;;
	2)
		input2=sudo hostname
		echo $input2
		echo "Thanks you for using my script $your_name.If u want to qui		t the process just write quit "
		exit
		;;

	3)
		input3=sudo ifconfig
		echo $input3
		;;
	4)
		input4=sudo who
		echo $input4
		;;
	5)
		input5=sudo cat /proc/meminfo
		echo $input5
		;;
	6)
		input6=sudo df -h
		echo $input6
		;;
	7)
		input7=sudo top
		echo $top
		;;
	8)
		echo "Which user operation do you want to edit.
		      Write 8.1 for add a new user!
		            8.2 for add a new  user to sudo group!
		            8.3 for add a new group!!
			    8.4 for changing user password!! 
			    8.5 for delete user!!
		       "
		       ;;
	*)
		echo "Wrong number $your_name!!Only usable [1-7]&[8-8.1]"
		;;
       esac
       read user_option
       case $user_option in

	8.1)
		echo "Write username please"
		read user_name
		sudo useradd $user_name
		echo "user account added , name $user_name"
		;;		
	8.2)
		echo "What user do u want to add to sudo group?"
		read user_name1
		sudo usermod -a -G sudo $user_name1 
		echo " $user_name1 added to sudo group "
		;;
	8.3)
		echo "Write the name of the group you want to add to system"
		read group_name
		sudo groupadd $group_name
		echo "new group added name $group_name"
		;;
	8.4)
		echo "Which user account password do u want to change? "
		read user_account
		sudo passwd $user_account
		echo "$user_account password changed "
		;;
	8.5)
		echo "Which user account do you want to delete"
		read user_account1
		sudo deluser $user_account1
		echo "deleted $user_account1"
		;;
	*)
		echo "Wrong number $your_name!!Only usable [1-7]&[8-8.1]"
		exit
		;;	
	
		
esac
	echo $_word
		read _exit
		case $_exit in 
			quit)
				exit
				;;
			*)
			while [ $_exit != $to_exit ]
			do
	echo "Invalid word!! Please write exact word  quit"
			read _exit
	      		done
			exit
			;;
			esac

done
			

