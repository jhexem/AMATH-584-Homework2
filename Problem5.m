%Problem 5 Part a

m = 500;
x = zeros([m, 1]);
y = zeros([m, 1]);

for j = 1:m
    x(j) = (j - 1) / (2 * m);
    y(j) = x(j) + (k + 1/2) / m;
end

A = zeros(m);
for j = 1:m
    for k = 1:m
        A(j,k) = 1 / (x(j) - y(k));
    end
end

[U, S, V] = svd(A);
s = diag(S);
idx = 1:m;
semilogy(idx, s, '.', 'MarkerSize', 10)
title('Singular Values of A')
xlabel('Index')
ylabel('Magnitude')

%%
%Problem 5 Part b

E = zeros([10, 1]);
for j = 1:10
    Aj = U(:, 1:j) * S(1:j, 1:j) * V(:, 1:j)';
    E(j) = norm(A - Aj);
end

idx = 1:10;
clf
semilogy(idx, E, '.', 'MarkerSize', 12)
hold on
semilogy(idx, s(2:11), '.', 'MarkerSize', 12)
title('Low Rank Approximation Error for A')
legend('Error', 'Singular Values')
xlabel('Rank of the Approximation')
ylabel('Magnitude')
hold off

%%
%Problem 5 Part c

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

[U, S, V] = svd(B);
s = diag(S);
idx = 1:500;
semilogy(idx, s, '.', 'MarkerSize', 6)
title('Plot of the Singular Values of B')
xlabel('Index of Singular Value')
ylabel('Singular Value Magnitude')

B10 = U(:, 1:10) * S(1:10, 1:10) * V(:, 1:10)';
ErrB = norm(B - B10)
FroErrB = norm(B - B10, "fro")