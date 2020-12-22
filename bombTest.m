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


pointX = [];
pointY = [];
flagX=[];
flagY=[];

while 1
    find = 0;
    re = 0;
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
        
        if ~isempty(pointX)
            for ii=1:length(pointX)
                if gx==pointX(ii) && gy==pointY(ii)
                    re = 1;
                    break
                end
            end
        end
        
        if re==1
            continue
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
        num = 0;
        for ii=0:2
            for jj=0:2
                for kk=1:2
                    if  gx+ii-1==bx(kk) && gy+jj-1==by(kk)
                        num = num +1;
                    end
                end
            end
        end
        if num == 0
            plot(gx+0.5,gy+0.5,'go');drawnow;            
        elseif num == 1
            plot(gx+0.5,gy+0.5,'yo');
        elseif num == 2
            plot(gx+0.5,gy+0.5,'ro');drawnow;
        end
        axis([0,5,0,5]);
        hold on
        pointX = [pointX, gx];
        pointY = [pointY, gy];
        
    elseif button == 3
        
        for ii=0:4
            if a>ii && a<=ii+1
                gx=ii;
            end
            if b>ii && b<=ii+1
                gy=ii;
            end
        end
        
        if ~isempty(pointX)
            for ii=1:length(pointX)
                if gx==pointX(ii) && gy==pointY(ii)
                    re = 1;
                    break
                end
            end
        end
        %{
        if ~isempty(pointX)
            for ii=1:length(pointX)
                if gx==pointX(ii) && gy==pointY(ii)
                    find = 1;
                    break
                end
            end
        end
        if find == 1
            continue
        end
        %}
        
        if re==1
            continue
        end
        
        plot(gx+0.5,gy+0.5,'bo');drawnow;
        axis([0,5,0,5]);
        hold on
        %{
        flagX=[flagX,gx];
        flagY=[flagY,gy];
        %}
    elseif button == 2
        break
        end
    if length(pointX)==23
        break
    end
end

