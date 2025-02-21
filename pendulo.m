% Parâmetros do pêndulo
L = 5;           % Comprimento do pêndulo
theta_max = 30;  % Ângulo máximo em graus
dt = 0.1;        % Intervalo de tempo para animação
total_time = 10; % Tempo total de simulação(segundos)

% Criar figura
figure(1);
clf;  % Limpar figura

% Loop principal da animação
for t = 0:dt:total_time

    % Calcular ângulo atual (movimento harmônico simples)
    theta = theta_max * cos(2*pi*t);  % Ângulo em graus

    % Converter para radianos para cálculos
    theta_rad = theta * pi/180;

    % Calcular posição do pêndulo usando matriz de rotação
    x = L * sin(theta_rad);
    y = -L * cos(theta_rad);

    % Limpar plot anterior
    clf;

    % Configurar limites e grade
    xlim([-5 5]);
    ylim([-6 4]);
    grid on;
    axis equal;
    title(sprintf('Simulação do Pêndulo - Ângulo Atual: %.1f°', theta));
    hold on;


    % Linha do pêndulo
    plot([0 x], [0 y], 'b-', 'LineWidth', 2);
    % Ponto de origem
    plot(0, 0, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 10);
    % Massa na ponta do pêndulo
    plot(x, y, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 15);

    % Desenhar arcos indicando os limites de -30° e 30°
    th = linspace(-30*pi/180, 30*pi/180, 100);
    plot(L*0.5*sin(th), -L*0.5*cos(th), 'r:', 'LineWidth', 1);

    % Adicionar eixos
    plot([-5 5], [0 0], 'k:', 'LineWidth', 0.5); % eixo x
    plot([0 0], [-6 4], 'k:', 'LineWidth', 0.5); % eixo y
    hold off;

    % Atualizar o gráfico
    drawnow;

    % Pausa para criar animação
    pause(0.1);
end
