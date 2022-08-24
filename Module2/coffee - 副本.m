% How much caffeine is there in the jar?

% n - number of days
% x - fraction of caffeinated 

nMax = 22; % max number of days to simulate

N = 10; % number of scoops in each jar
x = zeros(1,nMax); % fraction caffeinated
y = zeros(1,nMax)
x(1) = 0.1; % initial fraction caffeinated
y(1) = 0.1

for n=2:nMax
    
    %x(n-1) = (1-1/N) * x(n-1);
    %x(n) = x(n-1) - 1/N*x(n-1);
    x(n) = x(n-1)^2 - y(n-1)^2 -0.8
    y(n) = 2*x(n-1)*y(n-1) + 0.156
end % finished loop through days

% THE MODEL ^
% ------------------------------------------
% THE BEHAVIOR / THE OUTPUT ? 

% figure(1); 
% plot(x,'-ok');
% ylabel('x fraction caffeinated')
% xlabel('Days')

%figure(2);
%plot(y,'-ok');
%ylabel('y fraction caffeinated')
%xlabel('Days')

%figure(3); 
%plot(x, y, 'kx');
%ylabel('y')
%xlabel('x')

%xStart = rand([-2 2], [1,100]),
%yStart = rand([-2 2], [1,100]),

xStart = 4*rand(1, 100) -2,
yStart = 4*rand(1, 100) -2,
%figure(1)
%plot(xStart, yStart,'kx')
z = ones(1, 100)

for i=1:100
 x(1)= xStart(i),
 y(1)= yStart(i),
 nMax = 22,

  for n=2:nMax
    x(n) = x(n-1)^2 - y(n-1)^2 -0.8
    y(n) = 2*x(n-1)*y(n-1) + 0.156
  end
 
  if ((-2 <= x(22)) && (x(22) <= 2) && (-2 <= y(22)) && (y(22) <= 2))
      z(i) = true;
  else 
      z(i) = false; 
  end
end

plot(xStart(z(i)), yStart(z(i)),'r')
hold on,

