%% 关节角度初始化
theta=[0,pi/2,-pi/2,pi/6,pi/3,0]; %真正的关节角度，输入数值/数组
theta_1=[theta(1),theta(2)-pi/2,theta(3)+pi/2,theta(4),theta(5),theta(6)];
%自己写正变换，偏置不知道加哪里，就写在这里吧。。。
%不能用theta更新theta，建议像这里用theta_1，因为Toolbox要用真正的theta

A=fkine(robot,theta);%使用Toolbox获得的正变换矩阵
B=double(A);%换成double型，方便打印
C=p_kinematics(theta_1);%自建变换矩阵

B %打印B
C %打印C，自建正运动学转换和工具箱结果双重检验
%% 求末端位置
X=C(1,4);Y=C(2,4);Z=C(3,4);
%% 求末端姿态Rotations about X, Y, Z axes
R=C;
   if abs(abs(R(1,3)) - 1) < eps  %when |R13| == 1
       %singularity
       rpy(1) = 0;  %roll is zero
       if R(1,3) > 0
       rpy(3) = atan2( R(3,2), R(2,2));   %R+Y
       else
            rpy(3) = -atan2( R(2,1), R(3,1));   %R-Y
       end
       rpy(2) = asin(R(1,3));
   else
       rpy(1) = -atan2(R(1,2), R(1,1));
       rpy(3) = -atan2(R(2,3), R(3,3));
       rpy(2) = atan(R(1,3)*cos(rpy(1))/R(1,1));
   end
RPY=rpy*180/pi; %换成角度制
Rall=RPY(1);Pitch=RPY(2);Yaw=RPY(3);
Pos=[X,Y,Z,Rall,Pitch,Yaw];
Pos %打印physical position