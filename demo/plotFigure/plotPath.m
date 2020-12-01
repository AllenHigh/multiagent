function [] = plotPath(total,paths)
%PLOTPATH 此处显示有关此函数的摘要
% total表示需要绘制的路径总数
% paths表示元胞数组{N1x3, N2x3, ...}，有多个Nx3或者Nx2的矩阵

%判断是二维还是三维的
cellSize = size(paths{1})
row = cellSize(1)
column = cellSize(2)
if 2 == column
    for i = 1:total
        a = zeros(row,1);
        paths{i}(:,3) = a;
    end
end

% 用来测试的路径
pathTest = [-1,1,0;-0.99,1.01,0.02];

% 判断总数
totalpath = length(paths);
count = length(paths{1});
if(total ~= totalpath)
    return ;
end

for qn = 1:total
    start{qn} = paths{qn}(1,:);
    desired_state{qn} = zeros(3,1);
end

% 画框初始化
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

% 初始化模拟环境
time_tol = 30;          % 总的模拟时间
starttime = 0;          % 开始时间
tstep     = 0.01;       % 每个计算间隔时间
cstep     = 0.05;       % 两次绘图的时间间隔
time = starttime;
nstep = cstep/tstep;
%max_iter = time_tol/cstep;
max_iter = count;

% 开始仿真
OUTPUT_TO_VIDEO = 1;
if OUTPUT_TO_VIDEO == 1
    v = VideoWriter('map1.avi');
    open(v)
end

% 状态初始化，如果有多台无人机可以设循环
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

