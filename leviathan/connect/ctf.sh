echo 단계를 입력하시오. 
read STEP

arr=(`cat password`)
arr_leng=${#arr[@]}

if [ $STEP -gt $(($arr_leng - 1)) ]; then
	echo 새로운 단계의 비밀번호를 입력하시오.
	read PASSWORD
	echo $PASSWORD >> password 
	echo $arr_leng 번째 암호가 입력되었습니다!
else
	PASSWORD=${arr[$STEP]}
fi

echo 단계: $STEP 비밀번호: $PASSWORD
echo 접속을 시도합니다. 

sshpass -p "$PASSWORD" ssh -p 2223 leviathan$STEP@leviathan.labs.overthewire.org
