clc;
clear;

L1 = 0.06;
L2 = 0.062;
L3 = 0.131529;

s = 'Rz(q1) Ty(L1) Rx(q2) Ty(L2) Rx(q3) Tz(L3)';
dh = DHFactor(s);
t = dh.tool;
c = dh.command('leg');
leg = eval(c);

% transl( leg.fkine([0,0,0]) );
% 
% leg.plot([0,0,0], 'nobase', 'noshadow', 'notiles');
% % set(gca, 'Zdir','reverse');
% % view(137,48);
% 
% transl( leg.fkine([0, 0, 0]) );
% leg.plot([0, 0, 0], 'nobase', 'noshadow', 'notiles');
% 
% transl( leg.fkine([0, 0.2, 0]) );
% leg.plot([0, 0.2, 0], 'nobase', 'noshadow', 'notiles');
% 
% transl( leg.fkine([0, 0, 0.2]) );
% leg.plot([0, 0, 0.2], 'nobase', 'noshadow', 'notiles');

W = 0.176619;
L = 0.251619;
R = 0.134;

legs(1) = SerialLink(leg, 'name', 'leg1', 'base', SE3(L/2, W/2, 0)*SE3.Rz(-pi/4));
legs(2) = SerialLink(leg, 'name', 'leg2', 'base', SE3(0, R, 0));
legs(3) = SerialLink(leg, 'name', 'leg3', 'base', SE3(-L/2, W/2, 0)*SE3.Rz(pi/4));
legs(4) = SerialLink(leg, 'name', 'leg4', 'base', SE3(-L/2, -W/2, 0)*SE3.Rz(pi-pi/4));
legs(5) = SerialLink(leg, 'name', 'leg5', 'base', SE3(0, -R, 0)*SE3.Rz(pi));
legs(6) = SerialLink(leg, 'name', 'leg6', 'base', SE3(L/2, -W/2, 0)*SE3.Rz(pi+pi/4));

clf; k = 1;
while 1
    axis([-0.4 0.4 -0.4 0.4])
    legs(1).plot([0, 0, 0], 'nobase', 'noshadow', 'notiles');
    legs(2).plot([0, 0, 0], 'nobase', 'noshadow', 'notiles');
    legs(3).plot([0, 0, 0], 'nobase', 'noshadow', 'notiles');
    legs(4).plot([0, 0, 0], 'nobase', 'noshadow', 'notiles');
    legs(5).plot([0, 0, 0], 'nobase', 'noshadow', 'notiles');
    legs(6).plot([0, 0, 0], 'nobase', 'noshadow', 'notiles');
    patch([L/2 L/2 -L/2 -L/2], [-W/2 W/2 W/2 -W/2], [0.1 0.1 0.1 0.1],'FaceColor', 'r', 'FaceAlpha', 0.5);
    hold on;
    drawnow
end

% clf; k = 1;
% while 1
%     axis([-0.4 0.4 -0.4 0.4])
%     legs(1).plot([0, 0.4, -0.3], 'nobase', 'noshadow', 'notiles');
%     legs(2).plot([0, 0.4, -0.3], 'nobase', 'noshadow', 'notiles');
%     legs(3).plot([0, 0.4, -0.3], 'nobase', 'noshadow', 'notiles');
%     legs(4).plot([0, 0.4, -0.3], 'nobase', 'noshadow', 'notiles');
%     legs(5).plot([0, 0.4, -0.3], 'nobase', 'noshadow', 'notiles');
%     legs(6).plot([0, 0.4, -0.3], 'nobase', 'noshadow', 'notiles');
%     patch([L/2 L/2 -L/2 -L/2], [-W/2 W/2 W/2 -W/2], [0.1 0.1 0.1 0.1],'FaceColor', 'r', 'FaceAlpha', 0.5);
%     hold on;
%     drawnow
% end

% xf = 5; xb = -xf;   % forward and backward limits for foot on ground
% y = 5;              % distance of foot from body along y-axis
% zu = 2; zd = 5;     % height of foot when up and down
% segments = [xf y zd; xb y zd; xb y zu; xf y zu] * 0.01;
% segments = [segments; segments];
% tseg = [3 0.25 0.5 0.25]';
% tseg = [1; tseg; tseg];
% x = mstraj(segments, [], tseg, segments(1,:), 0.01, 0.1);
% xcycle = x(100:500,:);
% qcycle = leg.ikine( transl(xcycle), 'mask', [1 1 1 0 0 0] );

% clf; k = 1;
% while 1
%     legs(1).plot( gait(qcycle, k, 0, false) );
%     if k == 1, hold on; end
%     legs(2).plot( gait(qcycle, k, 100, false) );
%     legs(3).plot( gait(qcycle, k, 200, true) );
%     legs(4).plot( gait(qcycle, k, 300, true) );
%     drawnow
%     k = k + 1;
% end

