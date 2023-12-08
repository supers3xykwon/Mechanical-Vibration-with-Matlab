clc
clear
close all

% Define initial conditions.
x0 = [-0.25, 0.0, 0.25, 0.0]; % displacements and velocities

% time domain.
tspan = linspace(0, 100, 10000);

%% System
% Solve the EOM by a Numerical solver
[t, x] = ode45(@TwoDOF_FV, tspan, x0);

% Parameters for simulation visualization
dt = 0.01; % 시간 간격 (조정 가능)
totalTime = 100; % 전체 시뮬레이션 시간 (조정 가능)
timeSteps = 1:totalTime/dt;

% Window size
w = 1.0; % width
h = 0.1; % height

% 각 열에서 데이터 추출
displacement1 = x(:, 1);
velocity1     = x(:, 2);
displacement2 = x(:, 3);
velocity2       = x(:, 4);

% 애니메이션을 저장할 비디오 객체 생성
videoFile = VideoWriter('spring_mass_damper_animation.mp4', 'MPEG-4');
open(videoFile);

% 시뮬레이션 및 애니메이션
figure;

for tIndex = 1:length(timeSteps)
    t = timeSteps(tIndex);

    % 각 mass의 현재 위치 계산
    d1 = displacement1(t) - 0.5;
    d2 = displacement2(t) + 0.5;

    % 그림 초기화
    clf;

    % 두 개의 얇은 막대 그리기
    bar([-w, -w + 0.02], [0.02, 0.02], 'FaceColor', 'b', 'EdgeColor', 'none');
    hold on;
    bar([w, w - 0.02], [0.02, 0.02], 'FaceColor', 'b', 'EdgeColor', 'none');

    % 두 개의 직사각형 그리기 (mass 표현)
    rectangle('Position', [-0.5 - 0.01, -0.01, 0.02, 0.02], 'FaceColor', 'r', 'EdgeColor', 'none');
    rectangle('Position', [0.5 - 0.01, -0.01, 0.02, 0.02], 'FaceColor', 'g', 'EdgeColor', 'none');

    % 두 mass의 원점 표시
    rectangle('Position', [d1 - 0.01, -0.02, 0.04, 0.04], 'FaceColor', 'r', 'EdgeColor', 'none');
    rectangle('Position', [d2 - 0.01, -0.02, 0.04, 0.04], 'FaceColor', 'g', 'EdgeColor', 'none');

    hold off;

    xlim([-w, w]); % X-축 범위 설정 (조정 가능)
    ylim([-h, h]); % Y-축 범위 설정 (조정 가능)
    title(['Spring-Mass-Damper System Animation (Time: ', num2str(t * dt), 's)']);

    % 현재 그림을 비디오에 추가
    writeVideo(videoFile, getframe(gcf));
end

% 비디오 파일 닫기
close(videoFile);
