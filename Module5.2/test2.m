eps = 0.08;
a = 1.00;
b = 0.2;
I0 = 1.0;
% t_start = 40;
% t_stop = 47;
D = 0.9;

% i1 = @(t) I0*(t>t_start).*(t<t_stop);
f1 = @(v1,w1,v10,v2,t) v1 - 1/3*v1.^3 - w1 + D*(v10 - 2*v1 + v2);
g1 = @(v1,w1) eps*(v1 + a -b*w1);

% i2 = @(t) I0*(t>t_start).*(t<t_stop);
f2 = @(v2,w2,v1,v3,t) v2 - 1/3*v2.^3 - w2  + D*(v1 - 2*v2 + v3);
g2 = @(v2,w2) eps*(v2 + a -b*w2);

% i3 = @(t) I0*(t>t_start).*(t<t_stop);
f3 = @(v3,w3,v2,v4,t) v3 - 1/3*v3.^3 - w3 + D*(v2 - 2*v3 + v4);
g3 = @(v3,w3) eps*(v3 + a -b*w3);

% i4 = @(t) I0*(t>t_start).*(t<t_stop);
f4 = @(v4,w4,v3,v5,t) v4 - 1/3*v4.^3 - w4 + D*(v3 - 2*v4 + v5);
g4 = @(v4,w4) eps*(v4 + a -b*w4);

% i5 = @(t) I0*(t>t_start).*(t<t_stop);
f5 = @(v5,w5,v4,v6,t) v5 - 1/3*v5.^3 - w5 +  D*(v4 - 2*v5 + v6);
g5 = @(v5,w5) eps*(v5 + a -b*w5);

% i6 = @(t) I0*(t>t_start).*(t<t_stop);
f6 = @(v6,w6,v5,v7,t) v6 - 1/3*v6.^3 - w6 +  D*(v5 - 2*v6 + v7);
g6 = @(v6,w6) eps*(v6 + a -b*w6);

% i7 = @(t) I0*(t>t_start).*(t<t_stop);
f7 = @(v7,w7,v6,v8,t) v7 - 1/3*v7.^3 - w7 +  D*(v6 - 2*v7 + v8);
g7 = @(v7,w7) eps*(v7 + a -b*w7);

% i8 = @(t) I0*(t>t_start).*(t<t_stop);
f8 = @(v8,w8,v7,v9,t) v8 - 1/3*v8.^3 - w8 +  D*(v7 - 2*v8 + v9);
g8 = @(v8,w8) eps*(v8 + a -b*w8);

% i9 = @(t) I0*(t>t_start).*(t<t_stop);
f9 = @(v9,w9,v8,v10,t) v9 - 1/3*v9.^3 - w9 +  D*(v8 - 2*v9 + v10);
g9 = @(v9,w9) eps*(v9 + a -b*w9);

% i10 = @(t) I0*(t>t_start).*(t<t_stop);
f10 = @(v10,w10,v9,v1,t) v10 - 1/3*v10.^3 - w10 +  D*(v9 - 2*v10 + v1);
g10 = @(v10,w10) eps*(v10 + a -b*w10);

dxdt =@ (t,x) [f1(x(1),x(2),x(19),x(3),t); g1(x(1),x(2));
               f2(x(3),x(4),x(5),x(1),t); g2(x(3),x(4));
               f3(x(5),x(6),x(3),x(7),t); g3(x(5),x(6));
               f4(x(7),x(8),x(5),x(9),t); g4(x(7),x(8));
               f5(x(9),x(10),x(7),x(11),t); g5(x(9),x(10));
               f6(x(11),x(12),x(9),x(13),t); g6(x(11),x(12));
               f7(x(13),x(14),x(11),x(15),t); g7(x(13),x(14));
               f8(x(15),x(16),x(13),x(17),t); g8(x(15),x(16));
               f9(x(17),x(18),x(15),x(19),t); g9(x(17),x(18));
               f10(x(19),x(20),x(17),x(1),t); g10(x(19),x(20));];

[T,X] = ode45(dxdt,[0,100],rand(1,20));
figure(1)
plot(T,X)

