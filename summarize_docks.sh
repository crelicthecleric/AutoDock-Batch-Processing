touch ./energies/best_energies.list
for d in ./*.dlg
do
	echo $d
	fname=$(basename $d)
	name=$(echo "$fname" | cut -f 1 -d '.')
	egrep "^DOCKED: USER    Estimated Free Energy of Binding" $d | awk -v n=$d 'BEGIN {N=n} { print N " " $9}' > ./energies/$name.energies
	sort -nk2 ./energies/$name.energies -o ./energies/$name.energies
	head -1 ./energies/$name.energies >> ./energies/best_energies.list
done
sort -nk2 ./energies/best_energies.list -o ./energies/best_energies.list
