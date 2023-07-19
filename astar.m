%% star �㷨 obs��ʾ�ϰ���� �� map������ʼ����յ㡢��ͼ��Сx*x��
function path = astar(obsmap,map)
open=[];
close = [];
path = [];
pathflag=0;
model=[0 1 10;0 -1 10;1 0 10; 1 1 14;1 -1 14;-1 0 10;-1 1 14;-1 -1 14];   % ������Χ��8����
findflag = 0; % find the path succecs?
for i = 1:map.sizee+2     
    for j = 1:map.sizee+2
        if obsmap(i,j) == 1    %���ϰ������close list
            close = [i j 0 0 0 0;close];
            
        end
    end
end
mapinit = close;
 %                              ����f ����h ���ڵ�x��y
open = [map.start(1) map.start(2) 0 0 0 0];   %����ʼ�����openlist

while ~findflag
    if isempty(open)   % no enable path
        disp('No path to goal!!');
        return;
    end
    
    %������f����
    open = sortrows(open,3);
    %ȡ��������С�Ľڵ�,�Ƴ�openlist������closelist
    note = open(1,:);
    %close=[note ;close]
    open(1,:)=[];
    
    %������Χ8���ڵ� �ڵ���close�к��ԣ��ڵ���open�и��´���ֵ�͸��ڵ㣨ȡ��С�����ڵ㲻��openlist�м���openlist���������ֵ
    for ii = 1:8
        extend(1) = note(1)+model(ii,1);
        extend(2) = note(2)+model(ii,2); %������չ�ڵ�����
        check=is_open_close;
        [openflag,hang]=check.is_open(extend,open);
        closeflag = check.is_close(extend,close);
        if closeflag
            %continue;
        elseif  openflag
            %���´���
            if open(hang,3)>note(3)+model(ii,3)+10*sqrt((extend(1)-map.goal(1))^2+(extend(2)-map.goal(2))^2)
               open(hang,3)=note(3)+model(ii,3)+10*sqrt((extend(1)-map.goal(1))^2+(extend(2)-map.goal(2))^2);
               open(hang,5)=note(1);
               open(hang,6)=note(2);
            end
        else 
            %������� ����openlist
            extend(4)=10*sqrt((extend(1)-map.goal(1))^2+(extend(2)-map.goal(2))^2);
            extend(3)=note(3)+model(ii,3)+extend(4);
            extend(5)=note(1);
            extend(6)=note(2);
            open = [extend;open];
        end
        
        %�ж���չ�ڵ��Ƿ�ΪĿ���
        if extend(1) == map.goal(1) && extend(2)== map.goal(2) 
            findflag=1;
            close = [extend;close];
        end
    end
    close=[note ;close];
    
end

%�ҳ�·��
path = [map.goal(1),map.goal(2);path];
while ~pathflag
    for i = 1:length(close(:,1))
        if(path(1,1)==close(i,1)&&path(1,2)==close(i,2))  %�ҵ����ڵ㣬����path
            parentx=close(i,5);parenty=close(i,6);
            path = [parentx,parenty;path];
            break;
        end
    end
    if(path(1,1)==map.start(1)&&path(1,2)==map.start(2)) %�ж��Ƿ����������
        pathflag=1;
    end
end

end
