classdef combatsystem
    %SYSTEM 此处显示有关此类的摘要
    %   此处显示详细说明
    properties
        sysMap;             %地图范围大小为1000*200
        defPosition;
        ID;                 %无人机的id数组
        timeLimit;          %最大仿真时间
        
        attacker;
        attackerPath
    end

    methods
        function obj = combatsystem(map)
            %SYSTEM 构造此类的实例
            %   此处显示详细说明
            obj.sysMap = map;       %将外部的地图存储在内部
                                    %无人机群的信息提取并用来初始化系统
            coordinate = [0,100];
            attacker1 = attacker(coordinate);
            obj.attacker = attacker1;
            obj.attackerPath = attacker1.uavPath;
        end
        
        %系统：有一队无人机在设定的位置上
        function obj = initSystem(obj, defenderNum)
            %1.设定这群无人机的id号
            id = 1:defenderNum;

            %2.在一定活动范围之内，先设定这一队无人机的初始位置
            obj.defPosition = zeros(defenderNum, 2);
            for i = 1:defenderNum
                obj.defPosition(i, 1) = randi([1,200],1,1);
                obj.defPosition(i, 2) = randi([501,1000],1,1);
            end
            
%             figure(1);
%             plot(obj.defPosition(:,2),obj.defPosition(:,1),'*')
%             set(gca,'XLim',[0 1000]);
%             set(gca,'YLim',[0 200]);   
        end
        
        %防守方：根据攻击方无人机走过的位置，来判断接下来走的路
        %input: Nx2的矩阵，表示走过的路径
        %output: Nx2的矩阵，接下来一段时间的路径
        function obj = preditctPath(obj)
            
        end
        
        %防守方：从一群无人机中决策应该执行围捕任务的无人机
        function obj = decideDuty(obj)
            
        end
        
        %防守方：执行防守任务
        function obj = defendDuty(obj)
        
        end
        
        %防守方：侦测攻击方无人机的路径，并更新存储路径的变量
        function obj = detectPath(obj)
            
        end
        
%         %攻击方：判断接下来应该走的路径
%         %输入过去一段时间的路径，输出接下来一段时间路径
%         function obj = decidePath(obj)
%         end
        
        %系统：用来刷新输出的图像
        function obj = updataSystem(obj)
            
        end
        
        %系统：系统开始运行时的情况
        function obj = runSystem(obj)
            %1.攻击方无人机决定接下来一个时刻的位置
            
            %2.防守方无人机侦测攻击方无人机当前及历史的位置
            
            %3.防守方无人机做出决定，是否对于它采取行动
            
            %4.防守方无人机派出的小队对攻击方无人机进行围捕
            
        end
    end
end

