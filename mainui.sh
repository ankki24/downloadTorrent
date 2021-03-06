#!/bin/bash
echo -n "\n\n\n\n\n\n"
echo -n "WELCOME TO THE TERMINAL UI OF TV SHOW DOWNLOADER\n\n\n"
echo -n "MENU \n\n"
echo -n "INPUT '1' TO GET LIST OF AVAILABLE TV SHOWS\n"
echo -n "INPUT '2' TO SEARCH TV SHOW IN DATABASE\n"
echo -n "INPUT '3' TO ADD YOUR FAVOURITE SHOW\n"
echo -n "INPUT '4' TO DOWNLOAD ANY EPISOD OF TV SHOW\n"
echo -n "INPUT '5' TO USE FEATURE OF AUTO-DOWNLOAD\n"
read input
echo -n "YOU HAVE SELECTED OPTION: $input \n\n\n"
if [ "$input" -eq "1" ]
	then
		cat ./list.txt
elif [ "$input" -eq "2" ]
	then	
		echo -n "INPUT SEARCH STRING\n"
		read find_string
		grep -i ".*$find_string.*" ./list.txt 
		echo "\n\n"
elif [ "$input" -eq "3" ]
	then	
		echo -n "INPUT THE RELATIVE CODE OF YOUR FAVOURITE TV SHOW \n"
		read fav_code
		echo "$fav_code" > ./fav_list.txt
		sh ./letstry_bash.sh $fav_code
		echo "\n SHOW ADDED SUCCESSFULLY\n\n"
		echo "\n DO YOU WANT TO CHECK RECENT EPISOD OF THAT SHOW?\n Type [y/n] >\n"
		read rep
			if [ "$rep" = 'y' ]
				then
					sh ./episod.sh $fav_code		
					echo -n "\n\nDO YOU WANT TO DOWNLOAD ANY EPISOD FROM THESE\n REPLY [Y/N]\n"
					read fav_rep
						if [ "$fav_rep" = 'y' ]
							then 
								echo -n "\n\nSELECT EPISOD-ROW TO DOWNLOAD (START COUNT FROM 0)\n\n"
								read row_num
								sh ./download.sh $fav_code $row_num
						else
								echo " "
						fi

			else [ "$rep" = 'n' ]
				echo "BYE BYE"
			fi
elif [ "$input" -eq "4" ]
	then
		echo -n "INPUT CODE OF TV SHOW \n"
		read num 
		sh ./letstry_bash.sh $num
		echo -n "\nAVAILABLE EPISODS OF SELECTED TV SHOW"
		sh ./episod.sh $num
		echo -n "\n\nSELECT EPISOD-ROW TO DOWNLOAD (START COUNT FROM 0)\n\n"
		read row_num
		sh ./download.sh $num $row_num
elif [ "$input" -eq "5" ]
	then
		echo -n "WELCOME TO AUTO-DOWNLOAD FEATURE \n"
		#echo -n "ENTER UNIQUE CODE OF YOUR SHOW\n\n"
		#read fav_global_run
		#sh ./letstry_bash.sh $fav_global_run
		#echo "\n SHOW ADDED SUCCESSFULLY\n\n"
		echo -n "CHECKING IF ANY RECENT EPISOD AVAILABLE...........\n"
		sh ./update_proc.sh $(cat fav_list.txt)
		
		
else
	echo -n "\n*****************CHOOSE YOUR OPTION WISELY MATE ******************\n\n"	
	

fi

echo -n "\n\n\n\WANT TO CHOOSE ANOTHER OPTION?\n REPLY [y/n]\n\n"
read end_rep
if [ "$end_rep" = "y" ]
then
	clear	
	sh ./mainui.sh
else 
echo -n "\n\n\n*****************BYE BYE THANKS FOR USING****************\n\n"
fi
