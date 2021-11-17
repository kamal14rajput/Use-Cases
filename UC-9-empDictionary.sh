#!/bin/bash -x

isFullTime=2
isPartTime=1
max_hrs_in_month=100
emp_rate_per_hr=20
num_working_days=20

totalEmpHr=0
totalWorkingDays=0

function getWorkHrs() {
		case $1 in
			$isFullTime)
				empHrs=8
			;;
			$isPartTime)
				empHrs=4
			;;
			*)
				empHrs=0
			;;
		esac
}


function getEmpWage() {
		echo $(($1*$emp_rate_per_hr))

}

while [[ $totalEmpHr -lt $max_hrs_in_month && $totalWorkingDays -lt $num_working_days ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	getWorkHrs $empCheck
	totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWages[$totalWorkingDays]=$(($empHrs*$emp_rate_per_hr))
done

totalSalary="$( getEmpWage $totalEmpHr )"

echo ${dailyWages[@]}
echo ${!dailyWages[@]}
