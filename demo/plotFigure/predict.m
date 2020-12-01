clear all
%输入历史二维坐标的横坐标
x0=[0.25 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
%输入横坐标对应的纵坐标
y0=[3.36 3.33 3.30 3.33  3.02 2.75 2.65  2.55 2.43];
%确定取值区间（比如这里就是选取0-1.2，取1000为精度）
x=linspace(0,1.2,1000);
%生成对应的输出的纵坐标的值（也即包含x为1-1.2的y值，这部分就是预测值）
y1=interp1(x0,y0,x,'spline');

path1 = zeros(length(x), 3);
path1(:,1) = x(:);
path1(:,2) = y1(:);
path1(:,3) = 0;
path{1} = path1;
plotPath(1, path);

%输出可视化二维图线
plot(x0,y0,'o',x,y1,'r-','LineWidth',1.2,'markersize',4)
set(gca,'FontName','Times New Roman','FontSize',9);
legend('\fontname{楷体}数据点','spline','location','West')
legend boxoff;
