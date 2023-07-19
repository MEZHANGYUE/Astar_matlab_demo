%%
function A=is_open_close
% 下面定义的函数可以在这里调用
A.is_open=@is_open;
A.is_close=@is_close;
 
end
%% 
function [openflag,hang] = is_open(note,openlist)
    openflag=0;hang =1;
    for i = 1:length(openlist(:,1))
        if openlist(i,1)==note(1) && openlist(i,2)==note(2)
            openflag=1;
            hang = i;
            break;
        end
    end
end
%%
function closeflag = is_close(note,closelist)
    closeflag=0;
    for i = 1:length(closelist(:,1))
        if closelist(i,1)==note(1) && closelist(i,2)==note(2)
            closeflag=1;
            break;
        end
    end
end

