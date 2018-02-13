Z=matrix;
n=19;
for x=1:n;
    for y=1:n;
        if Z(x,y)<=0.65
            w(x,y)=0.7;
        else
            if Z(x,y)>0.75
                w(x,y)=0.25;
            else
                w(x,y)=0;
            end
        end 
    end
end
for x=1:n;                               %设置初始观点分布
    for y=1:n;
        if Z(x,y)<3/5
            Z(x,y)=-1;
        else
            if Z(x,y)>=3/5&Z(x,y)<4/5
                Z(x,y)=1;
            else
                Z(x,y)=0;
            end
        end
    end
end
for k=1:25;                                 %无干预阶段
    for x=2:18;
        for y=2:18;
            Z(x,y)=(1-w(x,y))*(Z(x-1,y-1)+Z(x-1,y)+Z(x-1,y+1)+Z(x,y-1)+Z(x,y+1)+Z(x+1,y-1)+Z(x+1,y)+Z(x+1,y+ ...
                1))/8+w(x,y)*Z(x,y);
        end
    end
   figure(k);
     for x=2:18;
        for y=2:18;
        if Z(x,y)<-0.15
           fill([y-1, y, y, y-1], [20-x, 20-x, 19-x, 19-x],'r');
        elseif Z(x,y) >0.15
           fill([y-1, y, y, y-1], [20-x, 20-x, 19-x, 19-x],'b');
        else
           fill([y-1, y, y, y-1], [20-x, 20-x, 19-x, 19-x],'c');
        end
        hold on
        end
     end
hold on
u = 1:18; v=u;
[x, y] = meshgrid(u, v);
plot(x, y,'k', y, x, 'k')
end


