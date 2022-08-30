% Make a plot of the first derivative estimate from finite differences.
% Make a plot of the 2nd and 3rd derivatives estimated from finite differences.
% What is the amount of noise (measured by standard deviation) to get all 3 derivatives accurate to within 10% of the true (analytic) value?

% ------------------------------------------------------
A     = 1.1; % fluorescence intensity units
omega = 2.6; % rad/s
A_0   = 0.01;
dt = 1;

u=@(t) A*sin(omega*t)+A_0;

tArray = linspace(0,1.6,200);
uArray = u(tArray); % an array of samples of u
% ------------------------------------------------------

% analytical solutions (in real life, we might not know these)
dudtExact      =  A*omega*cos(omega*tArray);
du2dt2Exact    = -A*omega^2*sin(omega*tArray);
du3dt3Exact    = -A*omega^3*cos(omega*tArray);

% Take the sample and add a bit of noise
 uObserved = @(t, error) u(t) + (error).*randn(size(t));
 m = rand(0, 100, 1);
 uArray_2 = uObserved(tArray, m);
 display(uArray_2)

t_dudt   = diff(uArray)./diff(tArray);
t_du2dt2 = diff(t_dudt)./diff(tArray(1:end-1));
t_du3dt3 = diff(t_du2dt2)./diff(tArray(1:end-2));

f_dudt   = diff(uArray_2)./diff(tArray);
f_du2dt2 = diff(f_dudt)./diff(tArray(1:end-1));
f_du3dt3 = diff(f_du2dt2)./diff(tArray(1:end-2));

dif_1 = max(abs((t_dudt - f_dudt)/ t_dudt));
dif_2 = max(abs((t_du2dt2 - f_du2dt2)/ t_du2dt2));
dif_3 = max(abs((t_du3dt3 - f_du3dt3)/ t_du3dt3));





