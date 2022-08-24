% 20220823

nMax = 22; % max number to simulate
x = zeros(1,nMax); % establish blank array
y = zeros(1,nMax);
x(1) = 0.1; 
y(1) = 0.1;
for n=2:nMax
    x(n) = x(n-1)^2 - y(n-1)^2 -0.8;
    y(n) = 2*x(n-1)*y(n-1) + 0.156;
end 

figure(1)
plot(x,'-ok');
ylabel('x');
xlabel('n');

figure(2)
plot(y,'-ok');
ylabel('y');
xlabel('n'); % task a and b

figure(3) 
plot(x, y, 'kx');
ylabel('y');
xlabel('x'); % task c

xStart = 4*rand(1, 100) -2;
yStart = 4*rand(1, 100) -2;
figure(4)
plot(xStart, yStart,'kx') %task d

figure(5)
meow(100, -0.8, 0.156); % task e

figure(6)
meow(100000, -0.8, 0.156); % task f

figure(7)
meow(100000, -0.7, 0.17);

figure(8)
meow(100000, -0.9, 0.149); % task g


function p=meow(m, c, d)
xxStart = 4*rand(1, m) -2;
yyStart = 4*rand(1, m) -2;
xx = zeros(1, 22); 
yy = zeros(1, 22);
for i=1:m
 xx(1)= xxStart(i);
 yy(1)= yyStart(i);
  for n=2:22
    xx(n) = xx(n-1)^2 - yy(n-1)^2 + c;
    yy(n) = 2*xx(n-1)*yy(n-1) + d;
  end
 
 if ((-2 <= xx(22)) && (xx(22) <= 2) && (-2 <= yy(22)) && (yy(22) <= 2))
      p=plot(xxStart(i),yyStart(i),'r.');
      hold on;
 else 
      p=plot(xxStart(i),yyStart(i),'b.');
      hold on; 
  end
end
hold off;
end