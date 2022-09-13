close all; clear; clc;
addpath(genpath(pwd));
N = 184;
theta = 2*pi*rand(N, 1);
phi = acos(2*rand(N, 1) - 1);
x = cos(theta).*sin(phi);
y = sin(theta).*sin(phi);
z = cos(phi);

x2 = x*1.5;
y2 = y*1.5;
z2 = z*1.5;
%Mesh the volume using DelaunayTri
Tfull = DelaunayTri(x, y, z);
Tfull_2 = DelaunayTri(x2, y2, z2);
%Find the triangulation on the boundary using freeBoundary
[T, X] = Tfull.freeBoundary();
[T2,X2] = Tfull_2.freeBoundary();
x = X(:, 1);
y = X(:, 2);
z = X(:, 3);

x2 = X2(:, 1);
y2 = X2(:, 2);
z2 = X2(:, 3);
trisurf(T, X(:, 1), X(:, 2), X(:, 3),'FaceColor','red')
hold on;
trisurf(T2, X2(:, 1), X2(:, 2), X2(:, 3),'FaceAlpha',0)
axis equal

% node1 = [transpose(X(:, 1)); transpose(X(:, 2)); transpose(X(:, 3))];
% face1 = transpose(T);
% node2 = [transpose(X2(:, 1)); transpose(X2(:, 2)); transpose(X2(:, 3))]
% face2 = transpose(T2);
% innerSphere.node = node1;
% innerSphere.face = face1;
% outerSphere.node = node2;
% outerSphere.face = face2;

% save('innerSphere.mat', 'innerSphere');
% save('outerSphere.mat', 'outerSphere');