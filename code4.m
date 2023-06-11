close all
clear;clc
aa=[0.48 0.25 0.4 0.08];
c={'.c';'.m';'.g';'.r'};%colors
for i=1:4
 a=aa(i);
A=[1 -1;2 -1];
B=[0.5 0.2;0.5 -1];
h=0.001;%%%%%%%%%%%step=h
tend=40;
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
for t=h:h:tend
 F=tanh(x);
x=x+(A*x+B*F)*h;
if (t-t_k>0.0 && (x'*P*x)>=exp(a)*(x_k'*P*x_k))||t-t_k>=9.129
 t_k=t;
 T_k2=[T_k2;t_k];
 x=(I+D)*x;
 x_k=x;
end
xx=[xx,x];
end
y2=a*ones(1,length(T_k2));
plot(T_k2,y2,c{i})
hold on
end
ylim([0,1])
xlabel('t','FontSize',14);
ylabel('x(t)','FontSize',14);
annotation("textarrow", [0.3506 0.3312], [0.6548 0.5216], "String", "t_2 = \tau_2")
plot(10,0.48,'mdiamond','MarkerSize', 8)
legend('t_k(a=0.48)','t_k(a=0.25)','t_k(a=0.4)','t_k(a=0.08)','\tau_2','Location','Best')