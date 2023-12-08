clc
clear
close all

% Define initial conditions.
x0 = [-1.0, 0.0, 1.0, 0.0];

% Parameters for simulation
dt = 0.01; % 시간 간격 (조정 가능)
totalTime = 100; % 전체 시뮬레이션 시간 (조정 가능)
timeSteps = 0:dt:totalTime;

%% System
% Solve the EOM using ode23 solver
options = odeset('RelTol', 1e-4, 'AbsTol', 1e-4);
[t, x] = ode45(@TwoDOF_FV_5, timeSteps, x0, options);

% Window size
w = 35.0; % width
h = 0.1; % height

% 각 열에서 데이터 추출
displacement1 = x(:, 1);
displacement2 = x(:, 3);

% 애니메이션을 저장할 비디오 객체 생성
videoFile = VideoWriter('spring_mass_damper_animation.mp4', 'MPEG-4');
open(videoFile);

% 시뮬레이션 및 애니메이션
figure;

for tIndex = 1:length(timeSteps)
    t = timeSteps(tIndex);

    % 각 mass의 현재 위치 계산
    d1 = displacement1(tIndex) - 1.0;
    d2 = displacement2(tIndex) + 1.0;

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

    %
    grid on
    hold off;

    xlim([-w, w]); % X-축 범위 설정 (조정 가능)
    ylim([-h, h]); % Y-축 범위 설정 (조정 가능)
    title(['Spring-Mass-Damper System Animation (Time: ', num2str(t), 's)']);

    % 현재 그림을 비디오에 추가
    writeVideo(videoFile, getframe(gcf));
end

% 비디오 파일 닫기
close(videoFile);
