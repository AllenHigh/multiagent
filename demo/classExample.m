classdef classExample
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here  详细解释如下
    
    properties               %定义属性－－－类变量
        x
        y
        sum
    end
    
    methods                  % 定义类的方法
        function obj = classExample (a,b)   %构造函数，函数类名一致，完成类中变量的初始化
            obj.x = a;
            obj.y = b;
        end
        
        function obj = test(obj, num)
            for i = 1:10
                num = num+i;
            end
            obj.x = num
        end
        
    end
end
