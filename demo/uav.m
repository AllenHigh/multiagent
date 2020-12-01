classdef uav
    %UAV ���˻�������
    %��ϸ���ݼ����˻�������˵���ĵ�
    
    properties
        uavID = 0;
        uavValueList;           %�����洢���ڲ�ͬ���˻�Ŀ���
        uavCoordinate;
        uavRole = 0;
        uavGroup = 0;
        uavGoal = 0;
        uavPath = [];
        uavRealPath = [];
        uavState = 0;
        uavAttackScope = 0;
        uavObserveScope = 0;
        uavChatScope = 0;
    end
    
    methods
        function obj = uav(role, coordinate)
            %UAV ��������ʵ��
            %   �˴���ʾ��ϸ˵��
            obj.uavRole = role;
            obj.uavCoordinate = coordinate;
        end
        
        % setGroup:set group number of the uav
        function obj = setGroup(obj,groupNum)
            obj.uavGroup = groupNum;
        end
        
        % setState:set state of the uav
        function obj = setState(obj,state)
            obj.uavState = state;
        end
    end
    
    methods
        function obj = calcuValue(uavID, coordinate)
            length = coordinate - obj.coordinate;   %��Ҫ�޸ģ�������뺯��
                                                    %��Ҫд��������ֵ��ĺ���
        end
        
        % calcuPath:calculate path of the uav
        function obj = calcuPath()
            obj.uavPath = path;
        end
    end
end

