clear;
close all;
system = combatsystem([]);
system = system.initSystem(10);
%plot(system.defPosition(:,1), system.defPosition(:,2))
plot(system.defPosition(:,2), system.defPosition(:,1),'*','LineWidth',1)