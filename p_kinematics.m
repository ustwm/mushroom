function T = p_kinematics(theta)%positive kinematics正运动学变换
    %已知关节角求变换矩阵
    a=[0,290,0,0,0,0];%定义长度
    d=[0,0,20,310,0,70];%定义偏移
    alpha=[-pi/2,0,pi/2,-pi/2,pi/2,0];%定义扭角
    
    T01=T_para(theta(1),d(1),a(1),alpha(1));
    T12=T_para(theta(2),d(2),a(2),alpha(2));
    T23=T_para(theta(3),d(3),a(3),alpha(3));
    T34=T_para(theta(4),d(4),a(4),alpha(4));
    T45=T_para(theta(5),d(5),a(5),alpha(5));
    T56=T_para(theta(6),d(6),a(6),alpha(6));
    
    T=T01*T12*T23*T34*T45*T56;
    
end

function T = T_para(theta,d,a,alpha)
    T=[cos(theta),-sin(theta)*cos(alpha),sin(theta)*sin(alpha),a*cos(theta);
        sin(theta),cos(theta)*cos(alpha),-cos(theta)*sin(alpha),a*sin(theta);
        0,sin(alpha),cos(alpha),d;
        0,0,0,1];
end

