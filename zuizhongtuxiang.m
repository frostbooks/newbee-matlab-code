z = rand(20);
for x = 1:20
    for y=1:20
        if z(x,y)<=0.3
           fill([y-1, y, y, y-1], [21-x, 21-x, 20-x, 20-x],'y');
        elseif z(x,y) >=0.7
           fill([y-1, y, y, y-1], [21-x, 21-x, 20-x, 20-x],'r');
        else
           fill([y-1, y, y, y-1], [21-x, 21-x, 20-x, 20-x],'c');
        end
        hold on
     end
end
hold on
m = 0:20; n=m;
[x, y] = meshgrid(m, n);
plot(x, y,'b', y, x, 'b')

