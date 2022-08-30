figure(1);
yyaxis left
for Damn=linspace(-3,2,10000)
k_on_A = 10;
k_off_A = 10;
k_on_I = 10;
k_off_I = 10;
k_cat_I = 10;
k_cat_A = 100;
I_tot = 100;
P_tot = 1;
K_tot = 10^Damn;


conc = zeros(4, 1);
dAdt = @(conc) -k_on_A * ( P_tot - conc(2) ) .* conc(1) + k_off_A * conc(2) + k_cat_A * conc(4);
dAPdt = @(conc) k_on_A * ( P_tot - conc(2) ) .* conc(1) - k_off_A *conc(2) - k_cat_I * conc(2);
dIdt = @(conc) -k_on_I * (K_tot - conc(4)) .* conc(3) + k_off_I * conc(4) + k_cat_I * conc(2);
dIKdt = @(conc) k_on_I * (K_tot - conc(4)) .* conc(3) - k_off_I * conc(4) - k_cat_A * conc(4);




sys = @(t, conc) [dAdt(conc); dAPdt(conc); dIdt(conc); dIKdt(conc)];

[T, X] = ode45(sys, [0,10], [0, 0, 100, 0]);


 semilogx(K_tot, X(end, 1), 'or');
 hold on;
end

% figure(2);
yyaxis right
for Damn=linspace(-3,2,10000)
k_on_A = 10;
k_off_A = 10;
k_on_I = 10;
k_off_I = 10;
k_cat_I = 10;
k_cat_A = 100;
I_tot = 1;
P_tot = 1;
K_tot = 10^Damn;


conc = zeros(4, 1);
dAdt = @(conc) -k_on_A * ( P_tot - conc(2) ) .* conc(1) + k_off_A * conc(2) + k_cat_A * conc(4);
dAPdt = @(conc) k_on_A * ( P_tot - conc(2) ) .* conc(1) - k_off_A *conc(2) - k_cat_I * conc(2);
dIdt = @(conc) -k_on_I * (K_tot - conc(4)) .* conc(3) + k_off_I * conc(4) + k_cat_I * conc(2);
dIKdt = @(conc) k_on_I * (K_tot - conc(4)) .* conc(3) - k_off_I * conc(4) - k_cat_A * conc(4);




sys = @(t, conc) [dAdt(conc); dAPdt(conc); dIdt(conc); dIKdt(conc)];

[T, X] = ode45(sys, [0,10], [0, 0, 1, 0]);


 semilogx(K_tot, X(end, 1), 'ob');
 hold on;
end
