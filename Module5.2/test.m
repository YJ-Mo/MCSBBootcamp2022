% model parameters
eps = 0.08;
a = 1.00;
b = 0.2;
I0 = 1.0;
t_start = 40;
t_stop = 47;
D = 0.9;

% model definition
I = @(t) I0*(t>t_start).*(t<t_stop);
f = @(v,w,t) v - 1/3*v.^3 - w + I(t) + D*(eval('v') - 2*v + v);
g = @(v,w) eps*(v + a -b*w);



%% single cell
dxdt =@ (t,x) [f(x(1),x(2),t); g(x(1),x(2))];
[T,X] = ode45(dxdt,[0,100], [-1.12982,-0.649085]);

figure(2); hold on;

plot(X(:,1),'.r')
ylabel('v')
xlabel('t');
hold off;


figure(3); hold on;
plot(X(:,2),'.b')
ylabel('w')
xlabel('t');
hold off;