clear;
%% ����Toolbox����ҪԤ�����أ�
% startup_rvc; %��������������
%% STD-DH����
%�������˵�D-H����
%����ƫ��
d1 = 0;
d2 = 0;
d3 = 20;
d4 = 310;
d5 = 0;
d6 = 70;
%���˳���
a1 = 0;
a2 = 290;
a3 = 0;
a4 = 0;
a5 = 0;
a6 = 0;
%����Ť��
alpha1 = -pi/2;
alpha2 = 0;
alpha3 = pi/2;
alpha4 = -pi/2;
alpha5 = pi/2;
alpha6 = 0;
%����������ģ��
%       theta  d        a        alpha    
L1=Link([0     d1       a1       alpha1]);
L2=Link([0     d2       a2       alpha2]);L2.offset = -pi/2;
L3=Link([0     d3       a3       alpha3]);L3.offset = pi/2;
L4=Link([0     d4       a4       alpha4]);
L5=Link([0     d5       a5       alpha5]);
L6=Link([0     d6       a6       alpha6]);
%���ƹؽڿռ�
L1.qlim = [(-180/180)*pi,(180/180)*pi];
L2.qlim = [(-127.5/180)*pi, (127.5/180)*pi];
L3.qlim = [(-152.5/180)*pi, (152.5/180)*pi];
L4.qlim = [(-270/180)*pi,(270/180)*pi];
L5.qlim = [(-122.5/180)*pi,(132.5/180)*pi];
L6.qlim = [(-270/180)*pi,(270/180)*pi];
%��������
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','Staubli');
% robot.plot([pi/2,pi/2,0,0,0,0]); %���ָ���ؽڽǶ�ͼ
robot.display();
robot.teach;%��ʾ�̴���
hold on