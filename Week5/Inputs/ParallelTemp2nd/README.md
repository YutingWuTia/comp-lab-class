# Assignment Week 5--3
 1. 
 $ sbatch tprFileGen.sbatch
 $ sbatch ParallelTemp.sbatch 
 2. 
 Make a free energy surface for T=300
 see ../../Analysis/Week5-assignment3_part1.ipynb
 3. 
 use the script demux.pl (available after loading gromacs module) on the log file in T300/ to generate files "replica_index.xvg replica_temp.xvg".
  $ cd T300/
  $ demux.pl adp_exchange4temps.log
 Plot how each replica is moving in temperature in replica_temp
 see ../../Analysis/Week5-assignment3_part2.ipynb 
 4. 
 Using 'gmx_mpi energy', calculate the potential energy in each replica.
 run the following command in each dir of 4 replicas: 
 $ mpirun -np 1 gmx_mpi energy -s adp.tpr -f adp_exchange4temps.edr -o energy.xvg
 (8,0) # 8 is selecting potential

 Compute a histogram of energy in each case, and plot all the histograms on the same plot.
 see ../../Analysis/Week5-assignment3_part3.ipynb 

