clear
clc
t = (0:0.5:50)'
a = t-1
b = t+1
c = 0.5*t

%这是针对于三维情况下的绘图
%path{1} = [a(:),b(:),c(:)]
%path{2} = [b(:),a(:),c(:)]
%path{3} = [c(:),a(:),b(:)]
%plotPath(3,path)

%二维情况下的绘图示例
path{1} = [a(:),b(:)]
path{2} = [b(:),a(:)]
path{3} = [c(:),a(:)]
plotPath(3,path);