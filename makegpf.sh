#!/bin/bash
receptors=$1/*.pdbqt
ligands=$(dirname $2)
ligand=$(basename $2)

source ~/.profile
cp $2 .

for r in $receptors
do	
	receptor=$(basename $r)
	cp $r .
	name=$(echo "$receptor" | cut -f 1 -d '.')
	pythonsh prepare_gpf4.py -l $ligand -r $receptor -p spacing=0.6 -p npts='126,126,126' -d $ligands -o $3/"$name".gpf
	rm ./$receptor
	cp $3/"$name".gpf ../../AutoDock-GPU-master/input/parp/$name/
done
rm ./$ligand
