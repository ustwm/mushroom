%% �ؽڽǶȳ�ʼ��
theta=[0,pi/2,-pi/2,pi/6,pi/3,0]; %�����ĹؽڽǶȣ�������ֵ/����
theta_1=[theta(1),theta(2)-pi/2,theta(3)+pi/2,theta(4),theta(5),theta(6)];
%�Լ�д���任��ƫ�ò�֪���������д������ɡ�����
%������theta����theta��������������theta_1����ΪToolboxҪ��������theta

A=fkine(robot,theta);%ʹ��Toolbox��õ����任����
B=double(A);%����double�ͣ������ӡ
C=p_kinematics(theta_1);%�Խ��任����

B %��ӡB
C %��ӡC���Խ����˶�ѧת���͹�������˫�ؼ���
%% ��ĩ��λ��
X=C(1,4);Y=C(2,4);Z=C(3,4);
%% ��ĩ����̬Rotations about X, Y, Z axes
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
RPY=rpy*180/pi; %���ɽǶ���
Rall=RPY(1);Pitch=RPY(2);Yaw=RPY(3);
Pos=[X,Y,Z,Rall,Pitch,Yaw];
Pos %��ӡphysical position