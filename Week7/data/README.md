# This dir is saving all the files we need to do protein structure prediction
 Instruction: https://github.com/YutingWuTia/comp-lab-class/blob/main/Week7/Assignment.md

__2W9T.pdb__: pdb file of 2W9T, 
downloaded from https://www.rcsb.org/structure/2W9T
__2W9T.fasta__: the FASTA file
downloaded from https://www.rcsb.org/structure/2W9T
__run-test.SBATCH__: this is a script to run alphafold on green. 
coped from /scratch/work/public/apps/alphafold/test-2.2.0/run-test.SBATCH
__test_596c5.result.zip__: this is the results from ColabFold: https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/AlphaFold2.ipynb#scrollTo=UGUBLzB3C6WN
__2W9T__: An output dir of __run-test.SBATCH__. The alphafold first generate .pkl files, based on which the unrelaxed_...pdb were generated. Then they would use Amber to get relaxed_...pbd. And alphafold would rank them with scores recorded in ranking_debug.json, generating ranked.pdb. 
__test_596c5.result.zip__: this is the results from RoseTTAFold:  https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/RoseTTAFold.ipynb#scrollTo=YWe2OSU59iKD