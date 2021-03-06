classdef attacker
    %UAV 无人机基础类
    %详细内容见无人机基础类说明文档

    properties
        attID = 0;
        attValueList;           %用来存储对于不同无人机目标的
        attCoordinate;
        attGroup = 0;
        attGoal = 0;
        attPath = [];           %N*2的矩阵，用来指定无人机运动路线
        attRealPath = [];
        attNext;                %无人机接下来一个时刻的位置
        attNow;                 %当前无人机的位置
        attState = 1;           %1：存活，0：死亡
        attAttackScope = 0;
        attObserveScope = 0;
        attChatScope = 0;
    end
    
    methods
        function obj = attacker(coordinate,timeLimit)
            %UAV 构造此类的实例
            %设定攻击方无人机的初始位置
            obj.attCoordinate = coordinate;
            obj = obj.setPath(timeLimit);
        end
        
        % 状态：用来设定无人机接下来的飞行路径，如果指定路径，可以直接输入
        function obj = setPath(obj,timeLimit)
            t = 1:timeLimit;
            obj.attPath = sin(0.225*t + pi / 70);
        end
        
        % 状态：设定无人机的工作状态
        function obj = setState(obj,state)
            obj.uavState = state;
        end
        
        %攻击方无人机决定接下来的飞行路径
        function obj = decidePath(obj, timeNow)
            obj.attNext = [timeNow+2, obj.attPath(timeNow+2)];
        end
        
        %判断攻击方无人机所处状态，来判断它应该做的事情
        function obj = runAttacker(obj, time)
            if(obj.attState == 1)
                obj.attNow = obj.attNext;
                obj.decidePath(time);
            end
            
        end
        
    end
end

