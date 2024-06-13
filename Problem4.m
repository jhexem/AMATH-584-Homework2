%Problem 4 Part a

A = ones([6, 6]);
B = [0 0 1 1 0 0; 0 0 1 1 0 0; 1 1 1 1 1 1; 1 1 1 1 1 1; 0 0 1 1 0 0; 0 0 1 1 0 0];
C = [1 1 1 0 0 0; 1 1 1 1 1 1; 0 0 0 0 0 0; 1 1 1 1 1 1; 0 0 0 0 0 0; 1 1 1 1 1 1];
D = [1 0 0 0 0 1; 0 1 0 0 1 0; 0 0 1 1 0 0; 0 0 1 1 0 0; 0 1 0 0 1 0; 1 0 0 0 0 1];
E = [1 1 0 0 0 0; 1 1 1 0 0 0; 0 1 1 1 0 0; 0 0 1 1 1 0; 0 0 0 1 1 1; 0 0 0 0 1 1];

[Ua, Sa, Va] = svd(A);
[Ub, Sb, Vb] = svd(B);
[Uc, Sc, Vc] = svd(C);
[Ud, Sd, Vd] = svd(D);
[Ue, Se, Ve] = svd(E);

svAvec = diag(Sa);
svBvec = diag(Sb);
svCvec = diag(Sc);
svDvec = diag(Sd);
svEvec = diag(Se);

tol = 1e-14;
svA = svAvec(abs(svAvec)>tol);
svB = svBvec(abs(svBvec)>tol);
svC = svCvec(abs(svCvec)>tol);
svD = svDvec(abs(svDvec)>tol);
svE = svEvec(abs(svEvec)>tol);

Matrix = ["A"; "B"; "C"; "D"; "E"];
Rank = [length(svA); length(svB); length(svC); length(svD); length(svE)];

p4atable = table(Matrix, Rank)

%%
% Problem 4 Part e

m = 500;
x = zeros([m, 1]);
y = zeros([m, 1]);
for j = 1:m
    x(j) = (j - 1) / m;
    y(j) = (j + 1/2) / m;
end

B = zeros([m, m]);
for j = 1:m
    for k = 1:m
        B(j, k) = 1 / (x(j) - y(k));
    end
end

surf(B);
shading flat;
view(3), colorbar, shg