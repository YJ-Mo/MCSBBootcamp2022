m = 100000;
x = zeros(1,22); % establish blank array
y = zeros(1,22);
z = zeros(1, m);


xStart = 4*rand(1, m) - 2;
yStart = 4*rand(1, m) - 2;

for i=1:m
 x(1)= xStart(i);
 y(1)= yStart(i);
  for n=2:22
    x(n) = x(n-1)^2 - y(n-1)^2 -0.8;
    y(n) = 2*x(n-1)*y(n-1) + 0.156;
    if ((-2 > x(n)) || (x(n) > 2) || (-2 > y(n)) || (y(n) > 2))
       z(i) = n;
       break
    end
  end
end

figure()
scatter(xStart,yStart,1,z)