clc

% 시뮬레이션 매개변수
dt = 0.01; % 시간 간격 (조정 가능)
totalTime = 5; % 전체 시뮬레이션 시간 (조정 가능)
timeSteps = 1:totalTime/dt;

% 각 열에서 데이터 추출
displacement1 = x(:, 1);
velocity1     = x(:, 2);
displacement2 = x(:, 3);
velocity2     = x(:, 4);

% 애니메이션을 저장할 비디오 객체 생성
videoFile = VideoWriter('spring_mass_damper_animation.mp4', 'MPEG-4');
open(videoFile);

% 시뮬레이션 및 애니메이션
figure;

for t = timeSteps
    % 각 mass의 현재 위치 계산
    d1 = displacement1(t);
    d2 = displacement2(t);

    % 그림 초기화
    clf;

    % 매스 및 스프링 시각화
    plot([-1, d1, d2, 1], [0, 0, 0, 0], 'o-', 'LineWidth', 2, 'MarkerSize', 10);
    xlim([-1, 1]); % X-축 범위 설정 (조정 가능)
    ylim([-0.5, 0.5]); % Y-축 범위 설정 (조정 가능)
    title(['Spring-Mass-Damper System Animation (Time: ', num2str(t*dt), 's)']);

    % 현재 그림을 비디오에 추가
    writeVideo(videoFile, getframe(gcf));
end

% 비디오 파일 닫기
close(videoFile);
