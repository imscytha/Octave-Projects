<p align="center"><img src="../assets/uni-logo.png" alt="image_description" style="width: 60%;">
<h1 align="center">Implementimi i Sistemit të Lorenz-it në MATLAB/GNU Octave</h1>

## Sistemi i Lorenz-it

Sistemi i Lorenz-it paraqet një model matematik të përbërë nga një sistem me tri ekuacione diferenciale,
të cilat përshkruajnë sjelljen e një sistemi 2 dimensional dhe ndryshimin e tij në kohë.
Në rastin e Sistemit të Lorenz-it,
shohim evolucionin e tri variablave (pozicioneve përgjatë hapsirës 3 dimensionale) $x,y,z$ në kohë $t$.

Sistemi i ekuacioneve të Sistemit të Lorenz-it e definojmë si vijon:

> $$ \LARGE \begin{cases} \frac{dx}{dt} = \sigma (y - x), \\ \frac{dy}{dt} = x (\rho - z) - y, \\ \frac{dz}{dt} = xy - \beta z. \end{cases} $$

Ekuacioni i parë përshkruan natyrën e variablës $x$ se si ndryshon pozitën e sajë në hapsirë me kalimin e kohës.
Varet nga vlerat e $y$ dhe $x$ në kohën aktuale,
dhe shumëzohet me një konstante të quajtur sigma ($\sigma$).
Ekuacioni i dytë përshkruan se si pozita $y$ ndryshon me kalimin e kohës.
Kjo varet nga vlerat e $x$, $y$ dhe $z$ në momentin aktual dhe shumëzohet me një konstante të quajtur rho ($\rho$).
Ndërsa ekuacioni i tretë përshkruan se si pozita $z$ ndryshon me kalimin e kohës.
Varet nga vlerat e $x$ dhe $y$ në momentin aktual dhe shumëzohet me një konstante të quajtur beta ($\beta$).
Të gjitha këto variabla pastaj me kalimin e kohës iterohen dhe kalkulohen si sistem i ekuacioneve diferenciale, të cilat pastaj shfrytëzojnë vleret e tyre paraprake për të kalkular pozitat e ardhshme,
rrjedhimisht kështu duke simuluar lëvizjen në hapsirë.

Çka e veçon Sistemin e Lorenz-it, është natyra e saj komplekse e cila pastaj e bën të vështirë e parashikueshmërinë se çka do t'ju ndodhë variablave $x$,$y$, dhe $z$ përgjatë kohës.
Në disa raste, ky sistem prodhon sjellje kaotike, ku me ndryshimin më të vogël të parametrave në fillim të sistemit, mund të prodhohen rezultate tejet të ndryshme gjatë kohës.
Kjo e bënë këtë sistem të paparashikueshëm në afate të gjata, nën vështrimin e një periudhe të shkurtër kohore.

### Aplikimi i Sistemit të Lorenz-it

Një nga aplikimet më të rëndësishme të sistemit Lorenz në jetën e përditshme mund të konstatojmë se është parashikimi i motit.
Përmes Sistemit të Lorenz-it shkencëtarët mund të ndrëtojnë një model të thjeshtëzuar të qarkullimit atmosferik që drejton modelet e motit.
Duke kuptuar sjelljen e sistemit Lorenz, meteorologët mund të fitojnë njohuri se si sillet atmosfera dhe rrjedhimisht të bëjnë parashikime më të sakta të motit.
Sistemi Lorenz gjen zbatim gjithashtu edhe në fusha të tjera si ekonomia, biologjia dhe inxhinieria.
Në ekonomi, sistemi përdoret për të modeluar sjelljen e tregjeve financiare.
Në biologji, përdoret për të studiuar dinamikën e popullsisë.
Ndërsa në inxhinieri, zbatim më të theksuar gjen në aerodinamikë, ku përdoret për të projektuar sisteme kontrolli për avionët dhe mjete të tjera komplekse fluturimi.

## Implementimi

### Konstruktimi i sistemit të ekuacioneve

Konstruktimin e sistemit të ekuacioneve në Octave e bëjmë fillimisht duke deklaruar konstantat $\sigma$, $\rho$ dhe $\beta$.
Duke shfytëzuar vetitë e Octave krijojmë një matricë $3 \times 1$ e cila përmban ekuacionet të trajtuara më sipër.
Për të kalkuluar sistemin e ekuacioneve diferenciale, në Octave mund të përdorim funksionin _ode45_.

Duke eksperimentuar me disa vlera, ky implementim në kod merr formën si vijon,

Inicializimi i ekuacionit diferencial me vlerën karakteristike rho=14:

```octave
rho    = 14;
sigma  = 10;
Beta   = 8/3;

odeFun = @(t,x) [sigma*(x(2)-x(1)); x(1)*(rho-x(3))-x(2); x(1)*x(2)-Beta*x(3)];
dt = 0:0.001:100;
init = [1 1 1];
[t,x] = ode45(odeFun,dt,init);
```

Paraqitjen grafike 3 dimensionale e arrijmë duke përdorur funksionin _plot3_:

```octave
figure(1, 'position', [0,0,1200,800])
plot3(x(:,1),x(:,2),x(:,3),'Color', 'm', 'LineWidth', 1.5)
grid on
for i = 1:360
    view(i,5);
    pause(0.02);
end
```

Ndryshimi i konstantes rho në 28;

```octave
rho    = 28;
odeFun = @(t,x) [sigma*(x(2)-x(1)); x(1)*(rho-x(3))-x(2); x(1)*x(2)-Beta*x(3)];
[t,x] = ode45(odeFun,dt,init);

plot3(x(:,1),x(:,2),x(:,3),'Color', 'b', 'LineWidth', 1.5)
grid on
for i = 1:540
    view(i,5);
    pause(0.02);
end

hold all
plot3(x(:,1),x(:,2),x(:,3),'Color', 'b', 'LineWidth', 1.5)
```

Ndryshimi i variablës x në vlerën iniciale për 1%:

```octave
init = [1.1 1 1]
[t,x] = ode45(odeFun,dt,init);

plot3(x(:,1),x(:,2),x(:,3),'Color', 'g', 'LineWidth', 1.5)
grid on
for i = 1:540
    view(i,5);
    pause(0.02);
end
hold off
```

Ndryshimi në parametrat e sistemit rezulton në paraqitjen grafike si vijon:

![Rotating Graph](../assets/Lorenz/rotating.gif)

Për të implementuar pamjen grafike ku shohim se cilën rrugë ndjek sistemi dhe ndryshimet kaotike në kalkulim përdorim funksionin _comet3_:

```octave
figure(2, 'position', [700,150,1200,800])
grid on
comet3(x(:,1),x(:,2),x(:,3));
```

![Comet](../assets/Lorenz/comet.gif)
