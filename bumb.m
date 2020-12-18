axis([0,5,0,5]);
x=[0,5];
for ii=1:4
    y=[ii,ii];
    plot(x,y,'k-');drawnow;
    axis([0,5,0,5]);
    hold on
end
y=[0,5];
for ii=1:4
    x=[ii,ii];
    plot(x,y,'k-');drawnow;
    axis([0,5,0,5]);
    hold on
end

b=randi([0,4],1,2);
bx=[b(1)];
by=[b(2)];

b=randi([0,4],1,2);
while 1
    if b(1) ~= bx(1) ||  b(2) ~= by(1)
        bx = [bx,b(1)];
        by = [by,b(1)];
        break
    end
end

find = 0;

while 1
    [a,b,button]=ginput(1);
    if button == 1
        for ii=0:4
            if a>ii && a<=ii+1
                gx=ii;
            end
            if b>ii && b<=ii+1
                gy=ii;
            end
        end
        for ii=1:2
            if gx==bx(ii) && gy==by(ii)
                plot(gx+0.5,gy+0.5,'ko');drawnow;
                axis([0,5,0,5]);
                find = 1;
            end
        end
        if find == 1
            break
        end
        plot(gx+0.5,gy+0.5,'ro');drawnow;
        axis([0,5,0,5]);
        hold on
    elseif button == 3
        for ii=0:4
            if a>ii && a<=ii+1
                gx=ii;
            end
            if b>ii && b<=ii+1
                gy=ii;
            end
        end
        plot(gx+0.5,gy+0.5,'bo');drawnow;
        axis([0,5,0,5]);
        hold on
    elseif button == 2
        break
    end
    
end

