function [X,P,X1,X2] = mesure(X,P,Z,R)

H=[1 0]

K=P*H'*inv(H*P*H'+R)
X=X+K*(Z-H*X)
P=(eye(2)-K*H)*P

X1=X(1);
X2=X(2);

end
