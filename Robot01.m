clear;
%% 加载Toolbox（需要预先下载）
% startup_rvc; %初次运行需载入
%% STD-DH参数
%定义连杆的D-H参数
%连杆偏移
d1 = 0;
d2 = 0;
d3 = 20;
d4 = 310;
d5 = 0;
d6 = 70;
%连杆长度
a1 = 0;
a2 = 290;
a3 = 0;
a4 = 0;
a5 = 0;
a6 = 0;
%连杆扭角
alpha1 = -pi/2;
alpha2 = 0;
alpha3 = pi/2;
alpha4 = -pi/2;
alpha5 = pi/2;
alpha6 = 0;
%建立机器人模型
%       theta  d        a        alpha    
L1=Link([0     d1       a1       alpha1]);
L2=Link([0     d2       a2       alpha2]);L2.offset = -pi/2;
L3=Link([0     d3       a3       alpha3]);L3.offset = pi/2;
L4=Link([0     d4       a4       alpha4]);
L5=Link([0     d5       a5       alpha5]);
L6=Link([0     d6       a6       alpha6]);
%限制关节空间
L1.qlim = [(-180/180)*pi,(180/180)*pi];
L2.qlim = [(-127.5/180)*pi, (127.5/180)*pi];
L3.qlim = [(-152.5/180)*pi, (152.5/180)*pi];
L4.qlim = [(-270/180)*pi,(270/180)*pi];
L5.qlim = [(-122.5/180)*pi,(132.5/180)*pi];
L6.qlim = [(-270/180)*pi,(270/180)*pi];
%连接连杆
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','Staubli');
% robot.plot([pi/2,pi/2,0,0,0,0]); %输出指定关节角度图
robot.display();
robot.teach;%打开示教窗口
hold on