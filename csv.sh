for d in ./*.energies
do
	awk '{print $2}' $d > temp.txt
	tr '\n' ',' < temp.txt > temps.txt
	cat temps.txt >> parp1.csv
	echo "" >> parp1.csv
done
