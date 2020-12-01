clear;
clc;
close all;
Cutoff=4;
num=10;
UAV_VALUE=rand(1,num);
[~,i]=sort(UAV_VALUE);
ID=i(1,num-Cutoff+1:num);

% ID = [1,2,3]';
ID=ID';
position_UAV = [0,10;0,5;0,-5;0,0];
t = (0:40)';
route = [6+t,3*t+6];

v_UAV = 3;
R = 1;
UAV_route = zeros(39,6);
UAV_route(1,1:2) = position_UAV(1,:);
UAV_route(1,3:4) = position_UAV(2,:);
UAV_route(1,5:6) = position_UAV(3,:);
UAV_route(1,7:8) = position_UAV(4,:);

tmp_posi = position_UAV;
for i = 1:38
    tmp_posi = catching(ID,tmp_posi,route(i:40,:),v_UAV,R);
    UAV_route(i+1,1:2) = tmp_posi(1,:);
    UAV_route(i+1,3:4) = tmp_posi(2,:);
    UAV_route(i+1,5:6) = tmp_posi(3,:);
    UAV_route(i+1,7:8) = tmp_posi(4,:);
end

figure;
p1= plot(route(1:39,1),route(1:39,2),'R.-');
 hold on;
p2= plot(UAV_route(:,1),UAV_route(:,2),'.-');
p3= plot(UAV_route(:,3),UAV_route(:,4),'.-');
p4= plot(UAV_route(:,5),UAV_route(:,6),'.-');
p5= plot(UAV_route(:,7),UAV_route(:,8),'.-');
legend('target','UAV1','UAV2','UAV3','UAV4');

for i=1:38
    set(p1,'XData',route(1:i,1), 'YData',route(1:i,2));
    set(p2,'XData',UAV_route(1:i,1),'YData',UAV_route(1:i,2));
    set(p3,'XData',UAV_route(1:i,3),'YData',UAV_route(1:i,4));
    set(p4,'XData',UAV_route(1:i,5),'YData',UAV_route(1:i,6));
    set(p5,'XData',UAV_route(1:i,7),'YData',UAV_route(1:i,8));
    drawnow
    
%     axis([0 50 0 60]);
    pause(0.1);
end

