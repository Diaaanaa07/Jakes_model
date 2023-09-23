% plot_Jakes_Flat.m
clc, clear
fd= 295;   %多谱勒频率 926Hz
Ts= 1e-6;  %采样周期
M= 2^12;   %自相关函数取值个数，但本程序删去了绘制自相关函数的代码部分
t= [0:M-1]*Ts;
f= [-M/2:M/2-1]/(M*Ts*fd);
Ns= 3000; %采样点数
t_state= 0;
% 信道生成
[h,t_state]=Jakes_Flat(fd,Ts,Ns,t_state,1,0);%调用函数
EH=mean(abs(h));
figure(1)%展示Jakes信道模型的时域特点、幅度/相位分布
subplot(211)
plot([1:Ns]*Ts,10*log10(abs(h)))
axis([0 Ns*Ts -20 10])
title(['Jakes信道模型, f_d=',num2str(fd),'Hz, T_s=',num2str(Ts),'s']);
xlabel('时间[s]'),ylabel('幅度[dB]');
subplot(223)
histogram(abs(h),50);
title(['Jakes信道模型, f_d=',num2str(fd),'Hz, T_s=',num2str(Ts),'s']);
xlabel('幅度'),ylabel('次数');
subplot(224)
histogram(angle(h),50);
title(['Jakes信道模型, f_d=',num2str(fd),'Hz, T_s=',num2str(Ts),'s']);
xlabel('相位[rad]'),ylabel('次数');
