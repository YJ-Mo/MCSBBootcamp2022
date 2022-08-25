x = zeros(1,100);
x(1) = .2;
%r_value=randperm(3);
r = [0.5, 1, 1.5, 2, 2.5];
K = 0.6;
z = zeros(1,5);
figure(1)

for i = 1:5
 for n=1:100
  x(n+1) = x(n) + r(i)*(1-x(n)/K)*x(n);
 end

 if(x(100) == x(50))
    z(i)=x(50);
    plot(r(i),x(50))
    hold on;
 else
    z(i) = length(unique(x));
    plot(r(i),length(unique(x)))
    hold on;
 end
end

plot(x)