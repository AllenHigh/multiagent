%%Χ��������Ŀǰֻ֧�ֶ�ά���������ܸĽ�Ϊά������Ӧ��
%���outΪN��n�о���NΪ�����UAV����nΪά�ȣ�
%����IDΪN-by-1������ΪUAV�������
%����position_cΪ��ID��Ӧ��UAV�ĵ�ǰλ��
%����routeΪԤ���Ŀ��Χ�����˶�·��
%����v_cΪUAV������ٶ�
%����RΪ��Χ�뾶��Ĭ��Ϊ1

function out = catching(ID,position_c,route,v_c,R)
    %�ж��Ƿ��ṩ�뾶R
    if nargin<5
        R = 1;
    end
    %�ж�ʵ����Ч·����û��ȱʧ���ݲ��֣�
    t_x = size(route(:,1),1);
    t_y = size(route(:,2),1);
    t = min(t_x,t_y);
    T = (0:1:t-1)';
    %����Χ��UAV��
    N = size(ID,1);
    
    out = position_c(1:N,:);
    %�������Χ��������λ��
    relative_position = zeros(N,2);
    %relative_position(1,:) = [R,0];
    for i = 1:N
        relative_position(i,:) = R * [cos(2*pi*(i-1)/N),sin(2*pi*(i-1)/N)];        
    end
    %·������
    for i = 1:N
        tmp_terminal(:,1) = route(:,1)+relative_position(i,1);
        tmp_terminal(:,2) = route(:,2)+relative_position(i,2);
        tmp_route(:,1) = (tmp_terminal(:,1) - position_c(i,1));
        tmp_route(:,2) = (tmp_terminal(:,2) - position_c(i,2));
        calc = sqrt(tmp_route(:,1).^2+tmp_route(:,2).^2)-T*v_c;
        %�ж�һ��ʱ�䵥λ�Ƿ���ֱ�ӽ���Χ��λ��
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