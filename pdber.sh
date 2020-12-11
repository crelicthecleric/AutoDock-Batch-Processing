#!/bin/bash

source ~/.profile

for f in *.pdbqt
do
	echo $f
	name=$(echo "$f" | cut -f 1 -d '.')
	echo $name
	pythonsh prepare_ligand4.py -l $f -A bonds_hydrogens -d ../ligand_dict.py -o ./prepped/$name.pdbqt
	echo working
done
