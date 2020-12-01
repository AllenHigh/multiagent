classdef uav
    %UAV 无人机基础类
    %详细内容见无人机基础类说明文档
    
    properties
        uavID = 0;
        uavValueList;           %用来存储对于不同无人机目标的
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
            %UAV 构造此类的实例
            %   此处显示详细说明
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
            length = coordinate - obj.coordinate;   %需要修改，计算距离函数
                                                    %需要写增加拍卖值表的函数
        end
        
        % calcuPath:calculate path of the uav
        function obj = calcuPath()
            obj.uavPath = path;
        end
    end
end

