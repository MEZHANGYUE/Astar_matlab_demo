clear;
clc;
map.sizee = 30;  %���õ�ͼ��С
map.start = [2 10];   %������ʼ��
map.goal = [30 19];   %����Ŀ���
map.obsnum = 50;
%% 
obsmap = Getobs(map);  %����ϰ����ͼ
path = astar(obsmap,map);  %����·��
gragh(map,obsmap,path);   %��ͼ