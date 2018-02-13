Z=matrix;
n=19;
for x=1:n;
    for y=1:n;
        if Z(x,y)<=0.65
            w(x,y)=0;
        else
            if Z(x,y)>0.75
                w(x,y)=0;
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
    a=0;b=0;c=0;
    for x=2:18;
        for y=2:18;
            Z(x,y)=(1-w(x,y))*(Z(x-1,y-1)+Z(x-1,y)+Z(x-1,y+1)+Z(x,y-1)+Z(x,y+1)+Z(x+1,y-1)+Z(x+1,y)+Z(x+1,y+ ...
                1))/8+w(x,y)*Z(x,y);
            if Z(x,y)<-0.15
                a=a+1;
            else 
                if Z(x,y)>0.15
                    b=b+1;
                else
                    c=c+1;
                end
            end
        end
    end
   A(k)=a;B(k)=b;C(k)=c; 
end
t=1:25;
figure(1);
plot(t,A,'-r*',t,B,'-b+',t,C,'-co');
    xlabel('统计次数');
    ylabel('元胞数');
