%%围捕函数（目前只支持二维，将来可能改进为维度自适应）
%输出out为N行n列矩阵（N为参与的UAV数，n为维度）
%输入ID为N-by-1向量，为UAV编号数组
%输入position_c为与ID对应的UAV的当前位置
%输入route为预测的目标围捕物运动路径
%输入v_c为UAV的最大速度
%输入R为包围半径，默认为1

function out = catching(ID,position_c,route,v_c,R)
    %判断是否提供半径R
    if nargin<5
        R = 1;
    end
    %判断实际有效路径（没有缺失数据部分）
    t_x = size(route(:,1),1);
    t_y = size(route(:,2),1);
    t = min(t_x,t_y);
    T = (0:1:t-1)';
    %计算围捕UAV数
    N = size(ID,1);
    
    out = position_c(1:N,:);
    %计算关于围捕物的相对位置
    relative_position = zeros(N,2);
    %relative_position(1,:) = [R,0];
    for i = 1:N
        relative_position(i,:) = R * [cos(2*pi*(i-1)/N),sin(2*pi*(i-1)/N)];        
    end
    %路径计算
    for i = 1:N
        tmp_terminal(:,1) = route(:,1)+relative_position(i,1);
        tmp_terminal(:,2) = route(:,2)+relative_position(i,2);
        tmp_route(:,1) = (tmp_terminal(:,1) - position_c(i,1));
        tmp_route(:,2) = (tmp_terminal(:,2) - position_c(i,2));
        calc = sqrt(tmp_route(:,1).^2+tmp_route(:,2).^2)-T*v_c;
        %判断一个时间单位是否能直接进入围捕位置
        if calc(2)<R 
            out(i,:)= tmp_terminal(2,:);
        else
            [target_T,~]=find(calc(2:t)<0,1);
            if ~isempty(target_T)
                catching_time = target_T;
            else
                [~,catching_time] = min(calc);
            end
            out(i,:) = position_c(i,:)+v_c*tmp_route(catching_time,:)/(sqrt(tmp_route(catching_time,1).^2+tmp_route(catching_time,2).^2)); 
        end
    end
end