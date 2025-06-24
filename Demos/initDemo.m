clear all;
close all;
clc;

garden = polyshape([2 10 10 -20 -20 2],[-15 -15 15 15 10 10]);
gardenGeometry = garden.Vertices;
x0 = [-15,12,deg2rad(90)];
vmax = 0.5;
dT = 0.01;

num = 1;



f0=figure
plot(garden)
hold on;
mower = [-0.1 -0.08 0.08 0.1 0.45 0.5 0.52 0.5 0.45 0.1 0.08 -0.08 -0.1 -0.1; -0.25 -0.27 -0.27 -0.25 -0.25 -0.1 0 0.1 0.25 0.25 0.27 0.27 0.25 -0.25];
plot(mower(1,:),mower(2,:))
daspect([1 1 1])

f00=figure
mower = [-0.1 -0.08 0.08 0.1 0.45 0.5 0.52 0.5 0.45 0.1 0.08 -0.08 -0.1 -0.1; -0.25 -0.27 -0.27 -0.25 -0.25 -0.1 0 0.1 0.25 0.25 0.27 0.27 0.25 -0.25];
plot(mower(1,:),mower(2,:))
daspect([1 1 1])
hold on;
xSpulen_local = [0.5 0.5 -0.05];
ySpulen_local = [0.2 -0.2 0];
plot(xSpulen_local,ySpulen_local,'x','LineWidth',3,'DisplayName','Drahtsignal-Sensoren')