%% ��ȡ��ͼ���ݣ�0��ʾ���ϰ���1��ʾ���ϰ�
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
end  % ���Ƶ�ͼ�߿�

%����sizee���ϰ����
for ii = 1:map.obsnum
    obsx=randi(map.sizee-1)+2;
    obsy=randi(map.sizee-1)+2;    
    basemap(obsx,obsy)=1;
end
basemap(map.start(1),map.start(2))=0;
basemap(map.goal(1),map.goal(2))=0;
end

