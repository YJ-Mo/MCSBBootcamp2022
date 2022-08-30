a_0 = 500; % molecules per hour
a_1 = 0.5; % molecules per hour, per existing molecule of A
b = 4; % 1/hrs
figure;
hold on;
    
    dPdt =@(P) (a_0 + a_1*P) - b*P; % Why do we need to redefine the ODE in the loop? *****************
    
    [T, P] = ode45(@(t,x)dPdt(x), [140,150], 0);
    
    plot(T,P);


