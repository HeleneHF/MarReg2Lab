function task_plotter(task, description)

PosXRight = 1; PosYRight = 2; alpha_VSP1 = 3; alpha_VSP2 = 4; omega_VSP1 = 5; omega_VSP2 = 6; u_BT = 7; u_VSP1 = 8; u_VSP2 = 9; Absolute_Time = 10;

task(:, Absolute_Time) = task(:, Absolute_Time) - task(1, Absolute_Time);
figure;
hold on;
plot(task(:,Absolute_Time), task(:, alpha_VSP1));
plot(task(:,Absolute_Time), task(:, alpha_VSP2), 'o');
plot(task(:,Absolute_Time), task(:, omega_VSP1));
plot(task(:,Absolute_Time), task(:, omega_VSP2), '+');
plot(task(:,Absolute_Time), task(:, u_BT));
plot(task(:,Absolute_Time), task(:, u_VSP1));
plot(task(:,Absolute_Time), task(:, u_VSP2), '--');
hold off;
legend('\alpha\_VSP1','\alpha\_VSP2','\omega\_VSP1','\omega\_VSP2','u\_BT','u\_VSP1','u\_VSP2');
title(description);
xlabel('Time [s]');
ylabel('Magnitude of output signal');
