# Input files for week 5
Credit for the input files for alanine come from https://www.plumed.org/doc-v2.7/user-doc/html/belfast-7.html

# Week 5--1
 1. Run an MD simulation of alanine dipeptide at 300K for 5 ns on 1 cpu, using gromacs 2018. 
 $ sbatch MD.sbatch

# Week 5--2
 2. Use mdtraj in a jupyter notebook to compute the phi and psi dihedral angles
 see ../Analysis/Week5-assignment2
 
 ref: https://www.mdtraj.org/1.9.8.dev0/api/generated/mdtraj.compute_phi.html
 ref: https://www.mdtraj.org/1.9.8.dev0/api/generated/mdtraj.compute_psi.html
  
  mdtraj.compute_phi/psi returns: 1. indices of atoms (phi[0]); 2. dihedral angles in each frame (phi[1])
  1） For phi[0], the shape is (n_phi, 4), because for each dihedral angle, 4 atoms (i.e. 2 planes) are needed to determine it.
  phi[0] would return like
  [index1-1 index2-1 index3-1 index4-1] # this combination determins first angle
  [index1-2 index2-2 index3-2 index4-2] # second angle
  ...
  In this case, there's only one dihedral angle value which is determined by atom 4/6/8/14
  2） For phi[1], the shape is (n_frames, n_phi), like
  [angle1 angle2 angle3 ... angleN] # in first frame
  [angle1' angle2' angle3' ... angleN'] # in second frame
  ...
  In this case, there are 5001 frames, and each contains one angle.

# Week 5--3
see ParallelTemp2nd/README.md