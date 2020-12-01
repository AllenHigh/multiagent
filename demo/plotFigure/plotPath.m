function [] = plotPath(total,paths)
%PLOTPATH �˴���ʾ�йش˺�����ժҪ
% total��ʾ��Ҫ���Ƶ�·������
% paths��ʾԪ������{N1x3, N2x3, ...}���ж��Nx3����Nx2�ľ���

%�ж��Ƕ�ά������ά��
cellSize = size(paths{1})
row = cellSize(1)
column = cellSize(2)
if 2 == column
    for i = 1:total
        a = zeros(row,1);
        paths{i}(:,3) = a;
    end
end

% �������Ե�·��
pathTest = [-1,1,0;-0.99,1.01,0.02];

% �ж�����
totalpath = length(paths);
count = length(paths{1});
if(total ~= totalpath)
    return ;
end

for qn = 1:total
    start{qn} = paths{qn}(1,:);
    desired_state{qn} = zeros(3,1);
end

% �����ʼ��
map = load_map('map4.txt', 0.2, 0.5, 0.25);

h_fig = figure('Name', 'Environment');

h_3d = gca;
drawnow;
xlabel('x [m]'); ylabel('y [m]'); zlabel('z [m]')
quadcolors = lines(total);
set(gcf,'Renderer','OpenGL')
backColor = [0,0,0];
set(gca, 'color', backColor);
plot_map(map);
pcshow(pathTest, [0,0,0],'MarkerSize', 0.5);

% ��ʼ��ģ�⻷��
time_tol = 30;          % �ܵ�ģ��ʱ��
starttime = 0;          % ��ʼʱ��
tstep     = 0.01;       % ÿ��������ʱ��
cstep     = 0.05;       % ���λ�ͼ��ʱ����
time = starttime;
nstep = cstep/tstep;
%max_iter = time_tol/cstep;
max_iter = count;

% ��ʼ����
OUTPUT_TO_VIDEO = 1;
if OUTPUT_TO_VIDEO == 1
    v = VideoWriter('map1.avi');
    open(v)
end

% ״̬��ʼ��������ж�̨���˻�������ѭ��
% desired_state = zeros(3,1);
x = start;

for iter = 1:count
    timeint = time:tstep:time+tstep;
    tic;
    if 1 == iter
        for qn=1:total
            QP{qn} = QuadPlotSimple(qn, start{qn}, 0.1, 0.04, quadcolors(qn,:), max_iter, h_3d);
            desired_state{qn}(:) = paths{qn}(iter, :);
            QP{qn}.UpdateQuadPlot(x{qn}, desired_state{qn}, time);
        end
        h_title = title(sprintf('iteration: %d, time: %4.2f', iter, time));
    else
        for qn=1:total
            x{qn} = desired_state{qn};
            desired_state{qn}(:) = paths{qn}(iter, :);
            QP{qn}.UpdateQuadPlot(x{qn}, desired_state{qn}, time + cstep);
        end
        set(h_title, 'String', sprintf('iteration: %d, time: %4.2f', iter, time + cstep))
        
        if OUTPUT_TO_VIDEO == 1
            im = frame2im(getframe(gcf));
            writeVideo(v,im);
        end
    end
    time = time + cstep; % Update simulation time
    
    t = toc;
    % Pause to make real-time
    if (t < cstep)
        pause(cstep - t);
    end
end

if OUTPUT_TO_VIDEO == 1
    close(v);
end
end

