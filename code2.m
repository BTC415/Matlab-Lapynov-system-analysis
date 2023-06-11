close all
clear;clc
A=[1 -1;2 -1];
B=[0.5 0.2;0.5 -1];
h=0.001;%%%%%%%%%%%step=h
tend=35;
x_0=[1 ;-2];
t_result=0:h:tend;
x=x_0;
xx=x_0;
t_k=0;%%%%%%%%initial instant
x_k=x_0;
T_k2=[];%%%%%%%%%record event-triggering instants
P=[110.1028 -25.8098;-25.8098 190.4531];
I=eye(2);
D=[-1.3816 -0.0873;-0.3314 -1.3600];
for t=h:h:tend
 F=tanh(x);
x=x+(A*x+B*F)*h;
if (t-t_k>0.0 && (x'*P*x)>=exp(0.48)*(x_k'*P*x_k))||t-t_k>=9.129
 t_k=t;
 T_k2=[T_k2;t_k];
 x=(I+D)*x;
 x_k=x;
end
xx=[xx,x];
end
y=zeros(length(T_k2),1);
plot(t_result,xx,'linewidth',1.2);
hold on
plot(T_k2, y, 'k.','MarkerSize', 15)
plot(T_k2(2), 0, 'go', 'MarkerSize', 15)
annotation("textarrow", [0.2625 0.3399], [0.6258 0.4868], "String", 't_2 = \tau_2')
xlabel('t','FontSize',14);
ylabel('x(t)','FontSize',14);
legend('x_1','x_2','{t_k}','\tau_2','Location','Best')
ylim([-3,4])
