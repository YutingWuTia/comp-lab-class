# In this dir, we are going to do the Assignment Week8
 1. Assignment link: https://github.com/YutingWuTia/comp-lab-class/blob/main/Week8/Assignment.md

# set up
 $ srun --tasks-per-node=1 --time=4:00:00 --mem=4GB --pty /bin/bash
 $ source /scratch/work/courses/CHEM-GA-2671-2022fa/software/lammps-gcc-30Oct2022/setup_lammps.bash
 $ cp -r /scratch/work/courses/CHEM-GA-2671-2022fa/software/lammps-gcc-30Oct2022/examples/melt/ .

# In dir Input/melt
 $ mpirun -np 1 lmp -in in.melt

# Part 1.1: In dir Input/testing
 $ mpirun -np 1 lmp -var density 0.5 -in ../Inputs/2dWCA.in

# Part 1.2: In dir Input/Part1.2
 $ sbatch changedensity.bash

