function mine(N,bn)
    I = imread('tiles.jpg');
    %image(X); 32*32; 32*384
    X = im2double(I);

    if N^2 < bn
        disp("炸彈比格子多是怎樣")
    elseif N^2 == bn
        disp("全是炸彈就別玩了吧")
    else

        %N=10; %幾乘幾
        %bn=15; %炸彈數
        count = 0; %計點開數

        background = zeros([32*N,32*N,3]);
        for ii = 0:N-1
            for jj = 0:N-1
                for si = 1:32
                    for sj = 1:32
                        background(32*ii+si,32*jj+sj,1)=X(si,32*10+sj,1);
                        background(32*ii+si,32*jj+sj,2)=X(si,32*10+sj,2);
                        background(32*ii+si,32*jj+sj,3)=X(si,32*10+sj,3);
                    end
                end
            end
        end
        image(background);drawnow;

        backinfo=zeros([N+2,N+2]);
        % 0=close, 1=open, 2=flag, 3=flagBomb, -1=bomb
        %{
        count = bn;
        while count > 0
            b=randi([2,2+N-1],1,2);
            if backinfo(b(1),b(2))==-1
                continue
            else
                backinfo(b(1),b(2))=-1;
                count = count-1;
            end
        end
        %}
        while count < N^2-bn
            [x,y,button] = ginput(1);
            %disp(button)
            if x<0 || x>32*N || y<0 || y>32*N
                continue
            end
            if button==1
                gi = floor(y/32)+2;
                gj = floor(x/32)+2;

                if backinfo(gi,gj)==-1 || backinfo(gi,gj)==3
                    for ii = 1:32
                        for jj = 1:32
                            background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*9,1);
                            background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*9,2);
                            background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*9,3);
                        end
                    end
                    image(background);drawnow;
                    break
                elseif backinfo(gi,gj)==0 || backinfo(gi,gj)==2
                    if count == 0
                        cc = bn;
                        if N^2-bn<9
                            while cc > 0
                                b=randi([2,2+N-1],1,2);
                                if backinfo(b(1),b(2))==-1 || (abs(b(1)-gi)<1 && abs(b(2)-gj)<1 )
                                    continue
                                else
                                    backinfo(b(1),b(2))=-1;
                                    cc = cc-1;
                                end
                            end 
                        else
                            while cc > 0
                                b=randi([2,2+N-1],1,2);
                                if backinfo(b(1),b(2))==-1 || (abs(b(1)-gi)<=1 && abs(b(2)-gj)<=1 )
                                    continue
                                else
                                    backinfo(b(1),b(2))=-1;
                                    cc = cc-1;
                                end
                            end 
                        end
                    end
                    num = 0;
                    for ii = 0:2
                        for jj = 0:2
                            if backinfo(gi+ii-1,gj+jj-1) == -1 || backinfo(gi+ii-1,gj+jj-1) == 3
                                num = num+1;
                            end
                        end
                    end
                    if num == 0
                        m = [];
                        m = [m,gi,gj];
                        c = 0;
                        while c < length(m)
                            a = m(c+1);
                            b = m(c+2);
                            if a==1 ||b ==1 || a==N+2 || b==N+2
                                c = c+2;
                                continue
                            end
                            if backinfo(a,b) == 0
                                n = 0;
                                for ii = 0:2
                                    for jj = 0:2
                                        if backinfo(a+ii-1,b+jj-1) == -1 || backinfo(a+ii-1,b+jj-1) == 3
                                            n = n+1;
                                        end
                                    end
                                end
                                if n == 0
                                    m = [m,a+1,b];
                                    m = [m,a,b+1];
                                    m = [m,a-1,b];
                                    m = [m,a,b-1];
                                    m = [m,a+1,b+1];
                                    m = [m,a+1,b-1];
                                    m = [m,a-1,b+1];
                                    m = [m,a-1,b-1];
                                    for ii = 1:32
                                        for jj = 1:32
                                            background((a-2)*32+ii,(b-2)*32+jj,1)=X(ii,jj,1);
                                            background((a-2)*32+ii,(b-2)*32+jj,2)=X(ii,jj,2);
                                            background((a-2)*32+ii,(b-2)*32+jj,3)=X(ii,jj,3);
                                        end
                                    end
                                elseif n == 1
                                    for ii = 1:32
                                        for jj = 1:32
                                            background((a-2)*32+ii,(b-2)*32+jj,1)=X(ii,jj+32,1);
                                            background((a-2)*32+ii,(b-2)*32+jj,2)=X(ii,jj+32,2);
                                            background((a-2)*32+ii,(b-2)*32+jj,3)=X(ii,jj+32,3);
                                        end
                                    end
                                elseif n == 2
                                    for ii = 1:32
                                        for jj = 1:32
                                            background((a-2)*32+ii,(b-2)*32+jj,1)=X(ii,jj+32*2,1);
                                            background((a-2)*32+ii,(b-2)*32+jj,2)=X(ii,jj+32*2,2);
                                            background((a-2)*32+ii,(b-2)*32+jj,3)=X(ii,jj+32*2,3);
                                        end
                                    end
                                elseif n == 3
                                    for ii = 1:32
                                        for jj = 1:32
                                            background((a-2)*32+ii,(b-2)*32+jj,1)=X(ii,jj+32*3,1);
                                            background((a-2)*32+ii,(b-2)*32+jj,2)=X(ii,jj+32*3,2);
                                            background((a-2)*32+ii,(b-2)*32+jj,3)=X(ii,jj+32*3,3);
                                        end
                                    end
                                elseif n == 4
                                    for ii = 1:32
                                        for jj = 1:32
                                            background((a-2)*32+ii,(b-2)*32+jj,1)=X(ii,jj+32*4,1);
                                            background((a-2)*32+ii,(b-2)*32+jj,2)=X(ii,jj+32*4,2);
                                            background((a-2)*32+ii,(b-2)*32+jj,3)=X(ii,jj+32*4,3);
                                        end
                                    end
                                elseif n == 5
                                    for ii = 1:32
                                        for jj = 1:32
                                            background((a-2)*32+ii,(b-2)*32+jj,1)=X(ii,jj+32*5,1);
                                            background((a-2)*32+ii,(b-2)*32+jj,2)=X(ii,jj+32*5,2);
                                            background((a-2)*32+ii,(b-2)*32+jj,3)=X(ii,jj+32*5,3);
                                        end
                                    end
                                elseif n == 6
                                    for ii = 1:32
                                        for jj = 1:32
                                            background((a-2)*32+ii,(b-2)*32+jj,1)=X(ii,jj+32*6,1);
                                            background((a-2)*32+ii,(b-2)*32+jj,2)=X(ii,jj+32*6,2);
                                            background((a-2)*32+ii,(b-2)*32+jj,3)=X(ii,jj+32*6,3);
                                        end
                                    end
                                elseif n == 7
                                    for ii = 1:32
                                        for jj = 1:32
                                            background((a-2)*32+ii,(b-2)*32+jj,1)=X(ii,jj+32*7,1);
                                            background((a-2)*32+ii,(b-2)*32+jj,2)=X(ii,jj+32*7,2);
                                            background((a-2)*32+ii,(b-2)*32+jj,3)=X(ii,jj+32*7,3);
                                        end
                                    end
                                elseif n == 8
                                    for ii = 1:32
                                        for jj = 1:32
                                            background((a-2)*32+ii,(b-2)*32+jj,1)=X(ii,jj+32*8,1);
                                            background((a-2)*32+ii,(b-2)*32+jj,2)=X(ii,jj+32*8,2);
                                            background((a-2)*32+ii,(b-2)*32+jj,3)=X(ii,jj+32*8,3);
                                        end
                                    end
                                end
                                backinfo(a,b)=1;
                                count = count+1;
                            end
                            c = c+2;
                        end
                    elseif num == 1
                        for ii = 1:32
                            for jj = 1:32
                                background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32,1);
                                background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32,2);
                                background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32,3);
                            end
                        end
                        count = count+1;
                    elseif num == 2
                        for ii = 1:32
                            for jj = 1:32
                                background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*2,1);
                                background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*2,2);
                                background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*2,3);
                            end
                        end
                        count = count+1;
                    elseif num == 3
                        for ii = 1:32
                            for jj = 1:32
                                background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*3,1);
                                background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*3,2);
                                background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*3,3);
                            end
                        end
                        count = count+1;
                    elseif num == 4
                        for ii = 1:32
                            for jj = 1:32
                                background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*4,1);
                                background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*4,2);
                                background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*4,3);
                            end
                        end
                        count = count+1;
                    elseif num == 5
                        for ii = 1:32
                            for jj = 1:32
                                background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*5,1);
                                background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*5,2);
                                background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*5,3);
                            end
                        end
                        count = count+1;
                    elseif num == 6
                        for ii = 1:32
                            for jj = 1:32
                                background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*6,1);
                                background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*6,2);
                                background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*6,3);
                            end
                        end
                        count = count+1;
                    elseif num == 7
                        for ii = 1:32
                            for jj = 1:32
                                background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*7,1);
                                background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*7,2);
                                background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*7,3);
                            end
                        end
                        count = count+1;
                    elseif num == 8
                        for ii = 1:32
                            for jj = 1:32
                                background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*8,1);
                                background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*8,2);
                                background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*8,3);
                            end
                        end
                        count = count+1;
                    end
                    backinfo(gi,gj) = 1;
                    image(background);drawnow;

                end
            elseif button==3
                gi = floor(y/32)+2;
                gj = floor(x/32)+2;

                if backinfo(gi,gj)==0
                    for ii = 1:32
                        for jj = 1:32
                            background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*11,1);
                            background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*11,2);
                            background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*11,3);
                        end
                    end
                    backinfo(gi,gj)=2;
                elseif backinfo(gi,gj)==2
                    for ii = 1:32
                        for jj = 1:32
                            background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*10,1);
                            background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*10,2);
                            background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*10,3);
                        end
                    end
                    backinfo(gi,gj)=0;
                elseif backinfo(gi,gj)==-1
                    for ii = 1:32
                        for jj = 1:32
                            background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*11,1);
                            background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*11,2);
                            background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*11,3);
                        end
                    end
                    backinfo(gi,gj)=3;
                elseif backinfo(gi,gj)==3
                    for ii = 1:32
                        for jj = 1:32
                            background((gi-2)*32+ii,(gj-2)*32+jj,1)=X(ii,jj+32*10,1);
                            background((gi-2)*32+ii,(gj-2)*32+jj,2)=X(ii,jj+32*10,2);
                            background((gi-2)*32+ii,(gj-2)*32+jj,3)=X(ii,jj+32*10,3);
                        end
                    end
                    backinfo(gi,gj)=-1;
                end
                image(background);drawnow;
            elseif button==2
                break
            end

        end
    end
end
