close all
clear;clc
A=[1 -1;2 -1];
B=[0.5 0.2;0.5 -1];
h=0.01;%%%%%%%%%%%step=h
tend=80;
x_0=[1 ;-2];
tt=0:h:tend;
x=x_0;
xx=x_0;
t_k=0;%%%%%%%%initial instant
x_k=x_0;
T_k2=[];%%%%%%%%%record event-triggering instants
P=[110.1028 -25.8098;-25.8098 190.4531];
I=eye(2);
D=[-1.3816 -0.0873;-0.3314 -1.600];
T_k2=[];%%%%%%%%%record event-triggering instants
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
plot(tt,xx,'linewidth',1.2);
hold on
y2=-0.2*ones(1,length(T_k2));
plot(T_k2,y2,'k.','MarkerSize', 12)
plot(T_k2(2), y2(2), 'go', 'MarkerSize', 12)
plot(T_k2(3), y2(3), 'bo', 'MarkerSize', 12)
xlabel('t','FontSize',14);
ylabel('x(t)','FontSize',14);
ylim([-3,6])
annotation("textarrow", [0.2958 0.2835], [0.5717 0.3763], "String", "t_3 = \tau_3")
annotation("textarrow", [0.2031 0.2267], [0.518 0.3791], "String", "t_2= \tau_2", "HorizontalAlignment", "right")
legend('x_1','x_2','{t_k}','\tau_2','\tau_3','Location','Best')
hold on
