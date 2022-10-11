# Tutorial
========================
http://www.mdtutorials.com/gmx/lysozyme/index.html 

# step 1-3
 see ../step1-3

# Energy minimization
(minimize the energy of system to ensure that the system has no steric clashes or inappropriate geometry)
========================
 $ mpirun -np 1 gmx_mpi grompp -f minim.mdp -c 1AKI_solv_ions.gro -p topol.top -o energymin.tpr
    __minim.mdp__: input parameter file (downloaded online)
    __energymin.tpr__ :the binary input file
 
 $ mpirun -np 1 gmx_mpi mdrun -v -deffnm energymin -s energymin.tpr
    __energymin.log__: ASCII-text log file of the EM process
    __energymin.edr__: Binary energy file
    __energymin.trr__: Binary full-precision trajectory
    __energymin.gro__: Energy-minimized structure

 $ mpirun -np 1 gmx_mpi energy -f energymin.edr -o potential.xvg
 (10 0)
 (Epot showed in the terminal should be negative, and (for a simple protein in water) on the order of e5-e6)
    __potential.xvg__ : Potential Energies during energy minimization (plot it in ../../Analysis) 

# Equilibration
(with a reasonable starting structure, in terms of geometry and solvent orientation, we still need to equilibrate(restrain) the solvent and ions to avoid the collapse of system)
========================    
 
PHASE 1: nvt Equilibration
 $ mpirun -np 1 gmx_mpi grompp -f nvt.mdp -c energymin.gro -r energymin.gro -p topol.top -o nvt.tpr
 $ mpirun gmx_mpi mdrun -v -deffnm nvt
    __nvt.mdp__ :(downloaded online)
    __nvt.tpr__ :the binary input file
    __nvt.log__: ASCII-text log file of the nvt Equilibration process
    __nvt.edr__: Binary energy file
    __nvt.trr__: Binary full-precision trajectory
    __nvt.gro__: structure after the nvt Equilibration process 

 $ mpirun -np 1 gmx_mpi energy -f nvt.edr -o temperature.xvg
 (16 0)
    __temperature.xvg__ : temperature during Equilibration under an NVT ensemble (plot it in ../../Analysis) 


PHASE 2: npt Equilibration
 $ mpirun -np 1 gmx_mpi grompp -f npt.mdp -c nvt.gro -r nvt.gro -t nvt.cpt -p topol.top -o npt.tpr
 $ mpirun -np 1 gmx_mpi mdrun -v -deffnm npt
(if introduce "-np 1" when employing mdrun, the process would be realy slow)
    __npt.mdp__ :(downloaded online)
    __npt.tpr__ :the binary input file
    __npt.log__: ASCII-text log file of the nvt Equilibration process
    __npt.edr__: Binary energy file
    __npt.trr__: Binary full-precision trajectory
    __npt.gro__: structure after the npt Equilibration process 
    __mdout.mdp__: output file of the npt Equilibration process 

 
 $ mpirun -np 1 gmx_mpi energy -f npt.edr -o pressure.xvg
 (18 0)
     __pressure.xvg__ : pressure during Equilibration under an NPT ensemble (plot it in ../../Analysis) 
 $ mpirun -np 1 gmx_mpi energy -f npt.edr -o density.xvg
 (24 0)
     __density.xvg__ : density during Equilibration under an NPT ensemble (plot it in ../../Analysis) 

# Production
see MD2.sbatch

# Analysis
 $ mpirun -np 1 gmx_mpi trjconv -s md_0_1.tpr -f md_0_1.xtc -o md_0_1_noPBC.xtc -pbc mol -center
 (1,0)
 $ mpirun -np 1 gmx_mpi rms -s md_0_1.tpr -f md_0_1_noPBC.xtc -o rmsd.xvg -tu ns
 (4,4)
 $ mpirun -np 1 gmx_mpi rms -s energymin.tpr -f md_0_1_noPBC.xtc -o rmsd_xtal.xvg -tu ns
 (4,4)
 $ mpirun -np 1 gmx_mpi gyrate -s md_0_1.tpr -f md_0_1_noPBC.xtc -o gyrate.xvg
 (1)