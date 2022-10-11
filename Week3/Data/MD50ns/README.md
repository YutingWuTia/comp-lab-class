# Tutorial
========================
http://www.mdtutorials.com/gmx/lysozyme/index.html 


# step 1-6
 see ../
 
# MD for 50ns -- first try
========================
 $ sbatch MD50ns.sbatch
     __MD50ns.out__ : output file says that our system is not well equilibrated, although it worked well in 1ns MD simulation


# MD for 50ns -- second try
========================
 $ sbatch MD50ns_2nd.sbatch
 in this sbatch job we use the file generated from minimization and start with equilibration. see MD50ns_2nd.sbatch

# Analysis(in dir 2ndTry)
 $ mpirun -np 1 gmx_mpi trjconv -s md_0_50.tpr -f md_0_50.xtc -o md_0_50_noWater.xtc -pbc mol -center
 (1,14)
 
 $ mpirun -np 1 gmx_mpi rms -s md_0_50.gro -f md_0_50_noWater.xtc -o rmsd50ns.xvg -tu ns
 (4,4)

 $ mpirun -np 1 gmx_mpi rms -s energymin.gro -f md_0_50_noWater.xtc -o rmsd_xtal50ns.xvg -tu ns
 (4,4)

 $ mpirun -np 1 gmx_mpi gyrate -s md_0_50.gro -f md_0_50_noWater.xtc -o gyrate50ns.xvg
 (1)
