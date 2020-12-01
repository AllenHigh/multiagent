classdef combatsystem
    %SYSTEM �˴���ʾ�йش����ժҪ
    %   �˴���ʾ��ϸ˵��
    properties
        sysMap;             %��ͼ��Χ��СΪ1000*200
        defPosition;
        ID;                 %���˻���id����
        timeLimit;          %������ʱ��
        
        attacker;
        attackerPath
    end

    methods
        function obj = combatsystem(map)
            %SYSTEM ��������ʵ��
            %   �˴���ʾ��ϸ˵��
            obj.sysMap = map;       %���ⲿ�ĵ�ͼ�洢���ڲ�
                                    %���˻�Ⱥ����Ϣ��ȡ��������ʼ��ϵͳ
            coordinate = [0,100];
            attacker1 = attacker(coordinate);
            obj.attacker = attacker1;
            obj.attackerPath = attacker1.uavPath;
        end
        
        %ϵͳ����һ�����˻����趨��λ����
        function obj = initSystem(obj, defenderNum)
            %1.�趨��Ⱥ���˻���id��
            id = 1:defenderNum;

            %2.��һ�����Χ֮�ڣ����趨��һ�����˻��ĳ�ʼλ��
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
        
        %���ط������ݹ��������˻��߹���λ�ã����жϽ������ߵ�·
        %input: Nx2�ľ��󣬱�ʾ�߹���·��
        %output: Nx2�ľ��󣬽�����һ��ʱ���·��
        function obj = preditctPath(obj)
            
        end
        
        %���ط�����һȺ���˻��о���Ӧ��ִ��Χ����������˻�
        function obj = decideDuty(obj)
            
        end
        
        %���ط���ִ�з�������
        function obj = defendDuty(obj)
        
        end
        
        %���ط�����⹥�������˻���·���������´洢·���ı���
        function obj = detectPath(obj)
            
        end
        
%         %���������жϽ�����Ӧ���ߵ�·��
%         %�����ȥһ��ʱ���·�������������һ��ʱ��·��
%         function obj = decidePath(obj)
%         end
        
        %ϵͳ������ˢ�������ͼ��
        function obj = updataSystem(obj)
            
        end
        
        %ϵͳ��ϵͳ��ʼ����ʱ�����
        function obj = runSystem(obj)
            %1.���������˻�����������һ��ʱ�̵�λ��
            
            %2.���ط����˻���⹥�������˻���ǰ����ʷ��λ��
            
            %3.���ط����˻������������Ƿ��������ȡ�ж�
            
            %4.���ط����˻��ɳ���С�ӶԹ��������˻�����Χ��
            
        end
    end
end

