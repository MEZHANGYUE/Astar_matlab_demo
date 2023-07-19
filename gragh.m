%% 
function gragh(map,obsmap,path)
    figure
    plot(map.start(1),map.start(2),'*r');hold on;
    plot(map.goal(1),map.goal(2),'*g');hold on ;
    for i = 1:length(obsmap(:,1))
        for j = 1:length(obsmap(:,1))
            if obsmap(i,j)==1
            plot(i,j,'*b');hold on ;
            end
        end
    end
    plot(path(:,1),path(:,2)) 
    axis([1 map.sizee+2 1 map.sizee+2])
    grid on;


end
%% 