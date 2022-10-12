#!/bin/bash

#SBATCH --job-name=run-gromacs
#SBATCH --nodes=1
#SBATCH --tasks-per-node=10
#SBATCH --time=72:00:00
#SBATCH --mem=20GB

cd /scratch/work/courses/CHEM-GA-2671-2022fa/yw5806/comp-lab-class/Inputs/ 

module purge

module load gromacs/openmpi/intel/2018.3

srun -n 10 gmx_mpi grompp -f adp_T300.mdp -c adp.gro -p adp.top -o md_T300.tpr
srun -n 10 gmx_mpi mdrun -v -deffnm md_T300

