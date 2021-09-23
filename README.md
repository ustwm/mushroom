# mushroom
Before running the Robot01.m, you need to download a Robot Toolbox.  
url: https://petercorke.com/resources/downloads/  

#After decompressing the Matlab_Robotic_Toolbox_v9.8.rar, place it in the installation directory of matlab, preferably in the toolbox folder. Use the setting path of the matlab toolbar to set the folder "Matlab_Robotic_Toolbox_v9.8\rvctools" to the search directory of matlab, in the command Enter "startup_rvc" in the window to run the startup_rvc.m file to automatically configure the environment variables of the toolbox.  
 
In p_kinematics.m, I built a transformation matrix without relying on the toolbox.  

In the main program, I compared the transformation matrices obtained by the two methods, and the results were basically the same. And I use the results obtained from the self-built matrix to directly establish the conversion of the joint position to the physical position.
