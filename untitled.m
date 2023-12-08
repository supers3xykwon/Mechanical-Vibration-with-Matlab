% 2DOF spring-mass-damper system의 운동방정식 정의
% m1, m2는 각각 질량, k1, k2는 스프링 상수, c1, c2는 댐퍼 상수
m1 = 1; m2 = 1;
k1 = 10; k2 = 5;
c1 = 0.1; c2 = 0.5;

% 초기 조건
initial_conditions = [0; 0; 0; 0]; % 초기 위치 및 속도

% 시뮬레이션 시간 범위
tspan = linspace(0, 10, 1000);

% 운동방정식 풀이
[t, y] = ode45(@(t, y) system_equations(t, y, m1, m2, k1, k2, c1, c2), tspan, initial_conditions);

% 애니메이션을 만들기 위한 반복문
figure;
for i = 1:length(t)
    % 현재 시간 스텝에서의 위치
    x1 = y(i, 1);
    x2 = y(i, 3);
    
    % 이전 플롯 삭제
    clf;
    
    % 현재 위치에 두 개의 점 플롯
    plot([0, x1, x2], [0, 0, 0], 'o-', 'MarkerSize', 10, 'LineWidth', 2);
    
    % 플롯 축 설정
    axis([-5 5 -1 1]);
    
    % 타이틀 설정
    title('2DOF Spring-Mass-Damper System Animation');
    
    % 시간 지연 추가 (애니메이션 속도 조절)
    pause(0.05);
end

% 시스템 운동방정식 정의 함수
function dydt = system_equations(t, y, m1, m2, k1, k2, c1, c2)
    % y(1): x1, y(2): x1_dot, y(3): x2, y(4): x2_dot
    
    % 운동방정식 정의
    dydt = zeros(4, 1);
    dydt(1) = y(2);
    dydt(2) = (-c1*y(2) - k1*y(1) + c2*(y(4) - y(2)) + k2*(y(3) - y(1)))/m1;
    dydt(3) = y(4);
    dydt(4) = (-c2*(y(4) - y(2)) - k2*(y(3) - y(1)))/m2;
end
