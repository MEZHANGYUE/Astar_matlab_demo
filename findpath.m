clear;
clc;
map.sizee = 30;  %设置地图大小
map.start = [2 10];   %设置起始点
map.goal = [30 19];   %设置目标点
map.obsnum = 50;
%% 
obsmap = Getobs(map);  %获得障碍物地图
path = astar(obsmap,map);  %计算路径
gragh(map,obsmap,path);   %绘图