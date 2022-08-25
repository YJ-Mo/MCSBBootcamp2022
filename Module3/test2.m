x = zeros(1,1000);
x(1) = .2;
K = 0.6;
z = zeros(1,5);
figure(1)
for r=0:0.01:3
  for n=1:1000
   x(n+1) = x(n) + r*(1-x(n)/K)*x(n);
  end

  plot(r,x(500:1000),'.')
  hold on;
end

hold off;