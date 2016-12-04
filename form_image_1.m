
X = 10*ones(100,100);

for i = 21:35
   for j = 40:70
       X(i,j) = 30;
   end
end

ic = 60
jc = 30
R  = 20

for i = 1:100
   for j = 1:100
      dist = sqrt((i-ic)^2 + (j-jc)^2);
      if dist <= R
         X(i,j) = 30;
      end
   end
end

for i = 60:80
   for j = 60:70 + (85-70)*(i-60)/(80-60)
      X(i,j) = 30;
   end
end

Z=10*ones(size(X));
%X1 = X;
X1 = [X, X];
%X1 = [X, X; Z, X];
%X1 = [Z,X,X; X,Z,X; X,X,Z];
% X1 = [Z,X,Z,X; X,Z,X,Z; Z,X,Z,X; X,Z,X,Z ];
%X1 = [Z,X,Z,X,Z; X,Z,X,Z,X; Z,X,Z,X,Z; X,Z,X,Z,X;Z,X,Z,X,Z];

X=X1;
save my_image_1 X




