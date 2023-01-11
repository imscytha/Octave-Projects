rho    = 14;
sigma  = 10;
Beta   = 8/3;

odeFun = @(t,x) [sigma*(x(2)-x(1)); x(1)*(rho-x(3))-x(2); x(1)*x(2)-Beta*x(3)];
dt = 0:0.001:100;
init = [1 1 1];
[t,x] = ode45(odeFun,dt,init);

figure(1, 'position', [0,0,1200,800])
plot3(x(:,1),x(:,2),x(:,3),'Color', 'm', 'LineWidth', 1.5)
title('Sistemi i Lorenz-it ku rho=14')
xlabel('x')
ylabel('y')
zlabel('z')
grid on
for i = 1:360
    view(i,5);
    pause(0.02);
end

rho    = 28;

odeFun = @(t,x) [sigma*(x(2)-x(1)); x(1)*(rho-x(3))-x(2); x(1)*x(2)-Beta*x(3)];

[t,x] = ode45(odeFun,dt,init);

plot3(x(:,1),x(:,2),x(:,3),'Color', 'b', 'LineWidth', 1.5)
title('Sistemi i Lorenz-it ku rho=28')
grid on
for i = 1:540
    view(i,5);
    pause(0.02);
end

hold all
plot3(x(:,1),x(:,2),x(:,3),'Color', 'b', 'LineWidth', 1.5)

init = [1.0001 1 1];
[t,x] = ode45(odeFun,dt,init);
plot3(x(:,1),x(:,2),x(:,3),'Color', 'g', 'LineWidth', 1.5)
title('Sistemi i Lorenz-it ku rho=28 me vektori fillestar [1.0001 1 1] ')
grid on
for i = 1:540
    view(i,5);
    pause(0.02);
end
hold off
figure(2, 'position', [700,150,1200,800])
comet3(x(:,1),x(:,2),x(:,3));
grid on
title('Gjurmimi i Sistemit të Lorenz-it')