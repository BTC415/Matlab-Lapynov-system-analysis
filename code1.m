close all
clear;clc
A = [1 -1;2 -1];
B = [0.5, 0.2;0.5 -1];
h = 0.01; %%%%%%%%%%%step=h
tend=200;
x_0=[1 -2]';
tt=0:h:tend;
x=x_0;
xx=x_0;
for t=h:h:tend
F=tanh(x);
x=x+(A*x+B*F).*h;
xx=[xx,x];
end
plot(tt,xx,'linewidth',1.2);
xlabel('t','FontSize',14);
ylabel('x(t)','FontSize',14);
legend('x_1','x_2','Location','Best')