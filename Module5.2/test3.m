epsilon = 0.08;
a = 1.0;
b = 0.2;
D = 0.9;    % electrical connectivity
I0 = 1.0;

dvdt = @(t,x) x(1:10) - (1/3) * x(1:10).^3 - x(11:20) + ... 
    D * ([x(10);x(1:9)] - 2*x(1:10) + [x(2:10);x(1)]);
dwdt = @(t,x) epsilon * (x(1:10) + a - b*x(11:20));

sys = @(t,x) [dvdt(t,x); dwdt(t,x)];
[T,X] = ode45(sys, [0,100], rand(1,20));
figure(3)
plot(T,X)

I = @(t) I0*(t>t_start).*(t<t_stop);
f = @(v,w,t) v - 1/3*v.^3 - w + I(t) + D*(v - 2*v + v);
g = @(v,w) eps*(v + a -b*w);