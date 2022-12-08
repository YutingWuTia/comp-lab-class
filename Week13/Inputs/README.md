## Part 1 - setup
Step2. Use vmd to open the file `Inputs/complex.prmtop` as the topology(file type: AMBER7 Parm), then `Inputs/complex.inpcrd`(file type: AMBER7 Restart)
Step3. In graphical representation, put in "protein" in Selected atoms, enter, then select "New Cartoon" in Draw style. Click "Creat Rep" icon, then put in "not protein and not water and not resid 352 to 600" in Selected atoms, select "CPK" in Draw style.
Step4. In the main menu, press the Save State button found in the File menu. In the text console, type save_state filename, where filename is the name of the file in which to save your work.(e.g. `viz_topology.vmd`)
