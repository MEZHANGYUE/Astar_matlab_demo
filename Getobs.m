%% 获取地图数据，0表示无障碍，1表示有障碍
function basemap = Getobs(map)

for i = 2:map.sizee+1
    for j = 2:map.sizee+1
        basemap(i,j)=0;
    end
end
for i = 1:map.sizee+2
    basemap(i,1)=1;
    basemap(1,i)=1;
    basemap(i,map.sizee+2)=1;
    basemap(map.sizee+2,i)=1;
end  % 绘制地图边框

%生成sizee个障碍物点
for ii = 1:map.obsnum
    obsx=randi(map.sizee-1)+2;
    obsy=randi(map.sizee-1)+2;    
    basemap(obsx,obsy)=1;
end
basemap(map.start(1),map.start(2))=0;
basemap(map.goal(1),map.goal(2))=0;
end

