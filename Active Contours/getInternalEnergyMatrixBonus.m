function [Ainv] = getInternalEnergyMatrixBonus(nPoints, alpha, beta, gamma)

A_ = zeros(1, nPoints);
A_(1, 1) = 2*alpha+6*beta;
A_(1, 2) = -alpha - 4* beta;
A_(1, 3) = beta;
A_(1, nPoints - 1) = beta;
A_(1, nPoints) = -alpha -4*beta;
A = zeros(nPoints,nPoints);

for i= 1:nPoints
    A(i,:) = A_;
    A_ = circshift(A_, 1);
end

Ainv = inv(A+ gamma.*eye(nPoints));
end 
