clear;
close all;
clc;

% for spacecraft with spin stabilization

I1 = .5*500*1.575^2/4;
I2 = .25*500*1.575^2/4 + 1/12*500*1.0668^2;
I3 = I2;
we1 = 80/60*2*pi; % angular velocity rad/s
SRP = 1;

A = [0 0 0; 0 (I3-I1)*we1/I2 0; 0 0 (I1-I3)*we1/I3];
B = diag(ones(1, 3));
Q = diag(ones(1, 3));
R = 1;
C = Q;
D = 0;
[K, ~, ~] = lqr(A, B, Q, R);

Ac = [(A-B*K)];
Bc = [B];
Cc = [C];
Dc = [D];
sys_cl = ss(Ac, B, C, D);
% c2d and d2c for continuous to discrete

% t = 0:0.01:30;
% r = zeros(length(t), 3);
% r(1,:) = 1;
% lsim(sys_cl, r, t);
% grid on;

impulse(sys_cl)
step(sys_cl)