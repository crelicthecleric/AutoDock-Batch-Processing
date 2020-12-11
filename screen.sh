#!/bin/bash
for parp in parp1 parp4 parp9 parp10 parp14 parp16
do
	for l in ./input/parp/ligands/*.pdbqt
	do
		ligand=$(basename $l)
		name=$(echo "$ligand" | cut -f 1 -d '.')
		./prebuilt/linux/autodock_gpu_256wi -ffile ./input/parp/$parp/$parp.maps.fld -lfile $l -resnam ./output/$parp/"$parp-$name" -nrun 10
	done
done
