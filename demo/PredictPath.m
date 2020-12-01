clear all;
clc;
t = 0:0.1:10;
y = sin(0.225*t + pi / 70);%�����Ԥ���һ���켣

%ȡһЩ��ʷ��ά����ĺ�����
x0 = 3:0.3:7;

%�õ���ʷ�������Ӧ��������
y0=sin(0.225*x0 + pi / 70);

%ȷ��ȡֵ���䣨�����������ѡȡ3-7��ȡ1000Ϊ���ȣ�
x=linspace(3,10,10000);

%���ɶ�Ӧ��������������ֵ��Ҳ������xΪ7-10��yֵ���ⲿ�־���Ԥ��ֵ��
y1=interp1(x0,y0,x,'spline');

%������ӻ���άͼ��
plot(x0,y0,'o',x,y1,'r-',t,y,'*','LineWidth',1.2,'markersize',4)

set(gca,'FontName','Times New Roman','FontSize',9);
legend('\fontname{����}���ݵ�','spline','location','West')
legend boxoff;


