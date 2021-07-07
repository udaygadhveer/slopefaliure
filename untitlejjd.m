Beta=input('enter value of beta :')
gamma=input('enter value of gamma :')
c=input('enter value of c :')
fans=intmax;
    for uv=10:2:Beta-1
        sum=0;
        itr=0;
        Alpha=uv;
        h=10;
        h1=h/tand(Beta);
        h2=h/tand(Alpha);
        r=h/sind(Alpha)/sind(Alpha)/2;
        x=[-10 -10 0 h1 h2 h2 -10];
        y=[-10 0 0 h h -10 -10];
        x1=[0 h2];
        y1=[0 h];
        x2=[h2/2 0];
        y2=[h/2 r];
        x3=[0 0];
        y3=[0 r];
        figure
        plot(x,y)
        str = sprintf('alpha :%d, Beta :%d', Alpha,Beta);
        title(str)
        pause(0), line(x1,y1,'color','b')
        pause(0), line(x2,y2,'color','r')
        pause(0), line(x3,y3,'color','r')
        x4=0:0.01:h2;
        y4= r-(r.^2-x4.^2).^(1/2);
        hold on
        plot(x4,y4)
        for in=0:0.01:h2
            itr=itr+1;
            sum=sum+(y4(itr)*0.01*(x4(itr)-(0.005)));
        end
        theta=atand((h-r)/h2)+90;
        area=((pi*r*r*theta/360)-((h1*h)+(h2*(r-h)))/2);
        sum=(h1*h1*h/3 + (h2-h1)*(h2+h1)*h/2)-sum;
        xx=sum/area;
        w=area*gamma;
        fos=r*r*c*deg2rad(theta)/w/xx;
        if fos<fans
            fans=fos;
            alpha=Alpha;
        end
            

 

    end
 

fprintf('Minimum Fos is :%f;\nAnd alpha for same is :%d',fans,alpha)