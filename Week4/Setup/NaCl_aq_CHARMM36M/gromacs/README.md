# all the commands run in this dir is recorded below

$ sbatch run_setup.bash

$ mpirun -np 1 gmx_mpi trjcat -f step5_1.xtc step5_2.xtc step5_3.xtc step5_4.xtc step5_5.xtc step5_6.xtc step5_7.xtc step5_8.xtc step5_9.xtc -o step5_all@1.xtc -settime -tu ns
 (0,1,2,3,4,5,6,7,8)

$ mpirun -np 1 gmx_mpi trjconv -pbc nojump -s step5_1.tpr -f step5_all@1.xtc -center -ur compact -o step5_all_unwrap@1.xtc
  (0,0)

$ mpirun -np 1 gmx_mpi trjconv -pbc nojump -s step5_1.tpr -f step5_1.gro -center -ur compact -o step5_unwrap.gro
  (0,0)


# Ref:
https://janheyda.files.wordpress.com/2018/01/diffusion-in-nacl-solution.pdf

$ mpirun -np 1 gmx_mpi trjconv -pbc nojump -s step5_1.tpr -f step5_1.gro -center -ur compact -o step5_unwrap.gro
  (0,0)

$ mpirun -np 1 gmx_mpi make_ndx -f step5_unwrap.gro -o step5_unwrap.ndx
  (q)

$ mpirun -np 1 gmx_mpi msd -f step5_all_unwrap@1.xtc -s step5_1.tpr -n step5_unwrap.ndx -o Oxy.xvg
  (4)
$ mpirun -np 1 gmx_mpi msd -f step5_all_unwrap@1.xtc -s step5_1.tpr -n step5_unwrap.ndx -o Cl.xvg
  (3)
$  mpirun -np 1 gmx_mpi msd -f step5_all_unwrap@1.xtc -s step5_1.tpr -n step5_unwrap.ndx -o Na.xvg
  (2)

