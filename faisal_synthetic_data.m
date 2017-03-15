
m = 100;
X = 10*ones(m,m); Y = X;  Y2 = X; Y3 = X;

%========================
% Three (old) shapes
for i = 21:35
   for j = 40:70
       Y3(i,j) = 30;
   end
end

ic = 60
jc = 30
R  = 20

for i = 1:100
   for j = 1:100
      dist = sqrt((i-ic)^2 + (j-jc)^2);
      if dist <= R
         Y3(i,j) = 30;
      end
   end
end

for i = 60:80
   for j = 60:70 + (85-70)*(i-60)/(80-60)
      Y3(i,j) = 30;
   end
end

%========================
% "Square C"
for i = 15:30
   for j = 15:50
       X(i,j) = 30;
   end
end

for i = 30:55
   for j = 15:30
       X(i,j) = 30;
   end
end

for i = 55:70
   for j = 15:50
       X(i,j) = 30;
   end
end
%========================
% Ellipse
ic = 50; jc = 50; a = 20; b = 40;
for i = 1:100
    A = (i-ic)^2/a^2;
    for j = 1:100
        B = (j-jc)^2/b^2;
        if A+B<=1, Y(i,j) = 30; end
        if i>ic & j < jc, Y(i,j) = 10; end
    end
end
%========================
% Concentric circles
ic = 50; jc = 50; r1 = 30; r2 = 10;
for i = 1:100
    A = (i-ic)^2;
    for j = 1:100
        B = (j-jc)^2;
        if A+B<=r1^2 & A+B>=r2^2, Y2(i,j) = 30; end
    end
end
%========================
Z=10*ones(size(X));
%X1 = X;
%X1 = [X, X];
%X1 = [X, Y; Y2, Y3];
%X1 = [Y2,X,Y3; X,Y2,Y3; Y3,X,Y];
%X1 = [X,Y,Y3,Y2;Z,X,Y,Y3;Y2,X,Y,Y3];
%X1 = [X,Y,Y2,Y3,Z;Y,Y3,Y2,X,Y;X,Y,Z,Y2,Y3;Y,Y2,Y3,X,Y3;Y2,Y3,X,Z,Y3];

X=X1;
save faisal_synthetic_data X




