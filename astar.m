%% star 算法 obs表示障碍物点 ， map包含起始点和终点、地图大小x*x；
function path = astar(obsmap,map)
open=[];
close = [];
path = [];
pathflag=0;
model=[0 1 10;0 -1 10;1 0 10; 1 1 14;1 -1 14;-1 0 10;-1 1 14;-1 -1 14];   % 搜索周围的8个点
findflag = 0; % find the path succecs?
for i = 1:map.sizee+2     
    for j = 1:map.sizee+2
        if obsmap(i,j) == 1    %将障碍物加入close list
            close = [i j 0 0 0 0;close];
            
        end
    end
end
mapinit = close;
 %                              代价f 代价h 父节点x，y
open = [map.start(1) map.start(2) 0 0 0 0];   %将起始点加入openlist

while ~findflag
    if isempty(open)   % no enable path
        disp('No path to goal!!');
        return;
    end
    
    %按代价f排序
    open = sortrows(open,3);
    %取出代价最小的节点,移出openlist，加入closelist
    note = open(1,:);
    %close=[note ;close]
    open(1,:)=[];
    
    %搜索周围8个节点 节点在close中忽略，节点在open中更新代价值和父节点（取较小），节点不在openlist中加入openlist，计算代价值
    for ii = 1:8
        extend(1) = note(1)+model(ii,1);
        extend(2) = note(2)+model(ii,2); %计算扩展节点坐标
        check=is_open_close;
        [openflag,hang]=check.is_open(extend,open);
        closeflag = check.is_close(extend,close);
        if closeflag
            %continue;
        elseif  openflag
            %更新代价
            if open(hang,3)>note(3)+model(ii,3)+10*sqrt((extend(1)-map.goal(1))^2+(extend(2)-map.goal(2))^2)
               open(hang,3)=note(3)+model(ii,3)+10*sqrt((extend(1)-map.goal(1))^2+(extend(2)-map.goal(2))^2);
               open(hang,5)=note(1);
               open(hang,6)=note(2);
            end
        else 
            %计算代价 加入openlist
            extend(4)=10*sqrt((extend(1)-map.goal(1))^2+(extend(2)-map.goal(2))^2);
            extend(3)=note(3)+model(ii,3)+extend(4);
            extend(5)=note(1);
            extend(6)=note(2);
            open = [extend;open];
        end
        
        %判断扩展节点是否为目标点
        if extend(1) == map.goal(1) && extend(2)== map.goal(2) 
            findflag=1;
            close = [extend;close];
        end
    end
    close=[note ;close];
    
end

%找出路径
path = [map.goal(1),map.goal(2);path];
while ~pathflag
    for i = 1:length(close(:,1))
        if(path(1,1)==close(i,1)&&path(1,2)==close(i,2))  %找到父节点，加入path
            parentx=close(i,5);parenty=close(i,6);
            path = [parentx,parenty;path];
            break;
        end
    end
    if(path(1,1)==map.start(1)&&path(1,2)==map.start(2)) %判断是否搜索到起点
        pathflag=1;
    end
end

end
