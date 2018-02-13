Z=matrix;
n=19;
for x=1:n;
    for y=1:n;
        if Z(x,y)<=0.65
            w(x,y)=0.25;
        else
            if Z(x,y)>0.75
                w(x,y)=0.7;
            else
                w(x,y)=0.5;
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
for k=1:4;                                 %无干预阶段
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
N=A(4)/289;
P=B(4)/289;
NEU=C(4)/289;
N=N-0.15;
P=P+0.2;
NEU=NEU-0.05;
Z=matrix;                                 %干预发生的开始点
for x=1:n;
    for y=1:n;
        if Z(x,y)<N                 %重新设置干预后的意见比例
            Z(x,y)=-1;
        else
            if Z(x,y)>=N&Z(x,y)<1-NEU
                Z(x,y)=1;
            else
                Z(x,y)=0;
            end
        end
    end
end
 for k=5;
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
N=A(5)/289;
P=B(5)/289;
NEU=C(5)/289;
N=N-0.1;
P=P+0.15;
NEU=NEU-0.05;
Z=matrix;                                 %干预发生的开始点
for x=1:n;
    for y=1:n;
        if Z(x,y)<N                 %重新设置干预后的意见比例
            Z(x,y)=-1;
        else
           if Z(x,y)>=N&Z(x,y)<1-NEU
                Z(x,y)=1;
            else
                Z(x,y)=0;
            end
        end
    end
end
for k=6;
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
N=A(6)/289;
P=B(6)/289;
NEU=C(6)/289;
N=N-0.08;
P=P+0.13;
NEU=NEU-0.05;
Z=matrix;                                        %干预过程持续阶段
for x=1:n;
    for y=1:n;
        if Z(x,y)<N%重新设置干预后的意见比例
            Z(x,y)=-1;
        else
             if Z(x,y)>=N&Z(x,y)<1-NEU
                Z(x,y)=1;
            else
                Z(x,y)=0;
            end
        end
    end
end
for k=7:25;                                           %干预后的阶段
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
