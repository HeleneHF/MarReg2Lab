function task_plotter(task, description)

PosXRight = 1; PosYRight = 2; alpha_VSP1 = 3; alpha_VSP2 = 4; omega_VSP1 = 5; omega_VSP2 = 6; u_BT = 7; u_VSP1 = 8; u_VSP2 = 9; Absolute_Time = 10;

task(:, Absolute_Time) = task(:, Absolute_Time) - task(1, Absolute_Time);
figure;
subplot(3,1,1);
hold on;
plot(task(:,Absolute_Time), task(:, alpha_VSP1));
plot(task(:,Absolute_Time), task(:, alpha_VSP2), 'o');
legend('\alpha\_VSP1','\alpha\_VSP2');
title(description);
subplot(3,1,2);
hold on;
plot(task(:,Absolute_Time), task(:, omega_VSP1));
plot(task(:,Absolute_Time), task(:, omega_VSP2), '+');
legend('\omega\_VSP1','\omega\_VSP2');
ylabel('Magnitude of output signal');
subplot(3,1,3);
hold on;
plot(task(:,Absolute_Time), task(:, u_VSP1));
plot(task(:,Absolute_Time), task(:, u_VSP2), '--');
plot(task(:,Absolute_Time), task(:, u_BT));
legend('u\_VSP1','u\_VSP2','u\_BT');
xlabel('Time [s]');
hold off;

