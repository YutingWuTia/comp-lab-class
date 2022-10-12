# all the commands run in this dir is recorded below

$ sbatch run_setup.bash

$ mpirun -np 1 gmx_mpi trjcat -f step5_1.xtc step5_2.xtc step5_3.xtc step5_4.xtc step5_5.xtc step5_6.xtc step5_7.xtc step5_8.xtc step5_9.xtc step5_10.xtc -o step5_all.xtc -settime -tu ns
 (0,10,20,30,40,50,60,70,80)

$ mpirun -np 1 gmx_mpi trjconv -s step5_1.tpr -f step5_all.xtc -center -pbc mol -ur compact -o step5_all_noSol.xtc
 (1,1)  # Select group for centering:'Protein' # Select group for output: 'Protein'

$ mpirun -np 1 gmx_mpi trjconv -s step5_1.tpr -f step5_1.gro -center -pbc mol -ur compact -o step5_noSol.gro
 (1,1)  # Select group for centering:'Protein' # Select group for output: 'Protein'
