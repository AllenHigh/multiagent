clear all;
clc;
t = 0:0.1:10;
y = sin(0.225*t + pi / 70);%这个是预设的一条轨迹

%取一些历史二维坐标的横坐标
x0 = 3:0.3:7;

%得到历史横坐标对应的纵坐标
y0=sin(0.225*x0 + pi / 70);

%确定取值区间（比如这里就是选取3-7，取1000为精度）
x=linspace(3,10,10000);

%生成对应的输出的纵坐标的值（也即包含x为7-10的y值，这部分就是预测值）
y1=interp1(x0,y0,x,'spline');

%输出可视化二维图线
plot(x0,y0,'o',x,y1,'r-',t,y,'*','LineWidth',1.2,'markersize',4)

set(gca,'FontName','Times New Roman','FontSize',9);
legend('\fontname{楷体}数据点','spline','location','West')
legend boxoff;


