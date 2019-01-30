function [Eext] = getExternalEnergy(I,Wline,Wedge,Wterm)

% Eline
Eline = I;

% Eedge
[Gx, Gy] = gradient(I);
Eedge = -1*sqrt(Gx.*Gx+Gy.*Gy);

% Eterm
[Cxx,Cxy] = gradient(Gx);
[~,Cyy] = gradient(Gy);
Eterm = (Cyy.*Gx.*Gx -2.*Cxy.*Gx.*Gy+Cxx.*Gy.*Gy)./((1+ Gx.*Gx+Gy.*Gy).^1.5);

% Eext
Eext = Wline*Eline + Wedge*Eedge + Wterm*Eterm; 
end

