function [X,P,X1,X2]=Approximation(dt,X,P,a)


A=[1 dt;
   0 1];

G=[(dt^2)/2;
    dt     ];


X = A*X;

P= A*P*A'+G*a*G';

X1=X(1);
X2=X(2);

end

