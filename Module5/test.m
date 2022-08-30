% dAdt = @(A, t) -k_on_A * ( P_tot - AP ) * A + k_off_A * AP + k_cat_A * IK;
% dAPdt = @(AP, t) k_on_A * ( P_tot - AP ) * A - k_of_A -k_cat_I * AP;
% dIdt = @(T, t) -k_on_I * I * (K_tot - IK) + + k_off_I * IK + k_cat_I * AP;
% dIKdt = @(IK, t) k_on_I * I * (K_tot - IK) -k_off_I * IK - k_cat_A * IK;
k_on_A = 10;
k_off_A = 10;
k_on_I = 10;
k_off_I = 10;
k_cat_I = 10;
k_cat_A = 100;
I_tot = 1;
P_tot = 1;
K_tot = 1;

conc = zeros(4, 1);
dAdt = @(conc) -k_on_A * ( P_tot - conc(2) ) .* conc(1) + k_off_A * conc(2) + k_cat_A * conc(4);
dAPdt = @(conc) k_on_A * ( P_tot - conc(2) ) .* conc(1) - k_off_A *conc(2) - k_cat_I * conc(2);
dIdt = @(conc) -k_on_I * (K_tot - conc(4)) .* conc(3) + k_off_I * conc(4) + k_cat_I * conc(2);
dIKdt = @(conc) k_on_I * (K_tot - conc(4)) .* conc(3) - k_off_I * conc(4) - k_cat_A * conc(4);



sys = @(t, conc) [dAdt(conc); dAPdt(conc); dIdt(conc); dIKdt(conc)];

[T, X] = ode45(sys, [0,10], [0, 0, 1, 0]);

figure(1);
subplot(2,2,1);
plot(T, X(:,1));
xlabel('A');

subplot(2,2,2);
plot(T, X(:,2));
xlabel('AP');

subplot(2,2,3);
plot(T, X(:,3));
xlabel('I')

subplot(2,2,4);
plot(T, X(:,4));
xlabel('IK');