m = 100000;
x = zeros(1,22); % establish blank array
y = zeros(1,22);
z = zeros(1, m);


xStart = 4*rand(1, m) - 2;
yStart = 4*rand(1, m) - 2;
figure()
for i=1:m
 x(1)= xStart(i);
 y(1)= yStart(i);
  for n=2:22
    x(n) = x(n-1)^2 - y(n-1)^2 -0.8;
    y(n) = 2*x(n-1)*y(n-1) + 0.156;
    if ((-2 <= x(22)) && (x(22) <= 2) && (-2 <= y(22)) && (y(22) <= 2))
       z(i) = n;
    end
  end
  if (z(i) == 0)
      scatter(x(1),y(1),'r.')
      hold on;
  elseif (z(i) == 21)
      scatter(x(1),y(1),'b.')
      hold on;
  elseif (z(i) == 22)
      scatter(x(1),y(1),'k.')
      hold on;
  else 
      scatter(x(1),y(1),'w.')
      hold on;
  end
hold off;
end

