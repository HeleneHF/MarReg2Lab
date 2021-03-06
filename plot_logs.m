clear all; clc; hold on; close all;
task_a = load('task-a.csv');
task_b = load('task-b.csv');
task_c = load('task-c.csv');
task_d = load('task-d.csv');
task_e = load('task-e.csv');


task_plotter(task_a, 'a) Pulling surge request');
task_plotter(task_b, 'b) Pushing surge request');
task_plotter(task_c, 'c) Port sway request');
task_plotter(task_d, 'd) Starboard sway request');
task_plotter(task_e, 'e) Clockwise yaw request');

task_1 = load('task-1.csv');
figure;
hold on;
task_1(:,3) = task_1(:,3) - task_1(1,3);
plot(task_1(:,3), task_1(:,1));
plot(task_1(:,3), task_1(:,2));
title('Joystick input');
legend('X','Y');
xlabel('Time');
ylabel('Magnitude');

%saveas(gcf,'case1.eps','eps2c'); %to save the figure
