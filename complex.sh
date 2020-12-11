source ~/.profile
for p in parp1 parp4 parp9 parp10 parp14 parp16
do
	for file in ./$p/*.dlg
	do
		interaction=$(basename $file)
		name=$(echo "$interaction" | cut -f 1 -d '.')
		pythonsh write_lowest_energy_ligand.py -f $file -o ./$p/$name.pdbqt
	done
done
