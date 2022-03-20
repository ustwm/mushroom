**Key Parameters in ‘Main’**

| **Parameters**              | **Line No.** | **Code**                                                         | **Description**                                                                                                                                                         |
|-----------------------------|--------------|------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| addpath                     | 30           | addpath('./folder')                                              | Change the folder name to which the STL files recorded.                                                                                                                 |
| time                        | 36           | t_end =                                                          | Combine with 'EndEffectorTrajectory' to create trajectories                                                                                                             |
|                             | 37           | t_rest =                                                         |                                                                                                                                                                         |
|                             | 38           | t_acc =                                                          |                                                                                                                                                                         |
|                             | 39           | delta_t =                                                        |                                                                                                                                                                         |
|                             | 40           | t_show =                                                         |                                                                                                                                                                         |
| Link name                   | 75、90、…      | global link_i                                                    | "Declare global variables 'Link_i'. Note that when the number of robot links varies, change these code"                                                                 |
| Define the links            | 76、92、…      | link_i = BodyJVACLASS(Env, 'link_i')                             | Call the class file and define the link.                                                                                                                                |
| Rotational inertia of links | 79、94、…      | link_i.B_I_B =                                                   | Obtained using CAD/CAE software                                                                                                                                         |
| Link mass                   | 77、93、…      | link_i.m_B =                                                     | Change the mass of links according to the official information                                                                                                          |
| STL model                   | 82、98、…      | stlProperty.name = 'link_i.stl'                                  | Modify the index name of each part STL file to import the model                                                                                                         |
| Model rotation              | 83、99、…      | stlProperty.A_Dstl =                                             | "Define the rotation of the model.Need to observe how it needs to be rotated after importing matlab"                                                                    |
| Model position              | 86、102、…     | stlProperty.xyz =                                                | "Define the location of the model origin in the matlab environment. Note that the model origin may change after importing matlab"                                       |
| Define the joints           | 193、205、…    | joint_i = RotationalJointJVACLASS(Env, 'J_i', link_i-1, link_i); | "Define joint_i. Note the joint type, if it is not a rotating joint, define the joint from another joint class file. Specify that joint_i connects link_i-1 and link_i" |
| Joint position              | 194、206、…    | joint_i.P_r_PDp =                                                | Define the origin of the joint coordinate system in Matlab environment                                                                                                  |
| Joint posture               | 195、207、…    | joint_i.A_PDp =                                                  | Describe the rotation of the joint coordinate system with respect to the parent Link (link_i-1) coordinate system                                                       |
| Link position               | 198、208、…    | joint_i.S_r_SDs =                                                | "Write the joint_i position under the link_i coordinate. The purpose is to define the coordinate position of link_i"                                                    |
| Link posture                | 199、209、…    | joint_i.A_SDs =                                                  | Describe the rotation of the link_i coordinate system with respect to the joint_i coordinate system                                                                     |
| Index of joint              | 202、210、…    | joint_i.q_index = i                                              | Enter the index number to bind the rotation angle to the joint                                                                                                          |
| Number of joints            | 264          | n_q = n                                                          | Define the number of joints 'n'                                                                                                                                         |

**Key Parameters in ‘InverseKinematics’**

| **Parameters**      | **Line No.** | **Code**                                                                      | **Description**                                                                     |
|---------------------|--------------|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| Initial guess value | 21           | X_INIT = [0; … ; 0];                                                          | The number of rows of the matrix should be equal to the number of joints            |
|                     | 31           | ground.recursiveForwardKinematics(q_des_(:, i_), [0; … ; 0], [0; … ; 0])      | The number of rows of the last two matrices should be equal to the number of joints |
|                     | 39           | ground.recursiveForwardKinematics(q_des_(:, i_), d_q_des_(:, i_), [0; … ; 0]) | The number of rows of the last matrix should be equal to the number of joints       |
|                     | 45           | ground.recursiveForwardKinematics(q_test_, [0; … ; 0], [0; … ; 0])            | The number of rows of the last two matrices should be equal to the number of joints |

**Key Parameters in ‘GetODETerms’**

| **Parameters**   | **Line No.** | **Code**                             | **Description**                        |
|------------------|--------------|--------------------------------------|----------------------------------------|
| Global variables | 5            | global link1 link2 … link_i grav n_q | Declare all links                      |
| Body             |              | bodies = {link1, link2, …, link_i}   | Declare the link contained in the body |

**Key Parameters in ‘EndEffectorTrajectory’**

| **Parameters** | **Line No.** | **Code**          | **Description**                           |
|----------------|--------------|-------------------|-------------------------------------------|
| Starting point | 18           | x_0 = [y; z; -x]; | Set starting point of end effector motion |
