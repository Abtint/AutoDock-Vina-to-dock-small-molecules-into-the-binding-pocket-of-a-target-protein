#!/bin/bash

# Directory paths(Needs specification based on your own file/folder locations)
LIGANDS_DIR="..../ligands"
RECEPTOR="/.....receptor.pdbqt"
OUTPUT_DIR="/..."

# Grid parameters (These parameters can change based on each test)
CENTER_X=7.54
CENTER_Y=-3.37
CENTER_Z=-8.65
SIZE_X=26
SIZE_Y=26
SIZE_Z=26

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Loop over each ligand file in the ligands directory
for LIGAND in $LIGANDS_DIR/*.pdbqt; do
    BASENAME=$(basename $LIGAND)
    OUTPUT="$OUTPUT_DIR/${BASENAME%.pdbqt}_out.pdbqt"
    
    vina --receptor $RECEPTOR \
         --ligand $LIGAND \
         --center_x $CENTER_X --center_y $CENTER_Y --center_z $CENTER_Z \
         --size_x $SIZE_X --size_y $SIZE_Y --size_z $SIZE_Z \
         --out $OUTPUT \
         --verbosity 3
done

echo "Docking completed for all ligands!"
