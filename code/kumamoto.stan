data {
int<lower=1> N;
int<lower=1> J;
int<lower=1> M;
int<lower=1,upper=J> eq[N];
int<lower=1,upper=M> sph[N];
int<lower=1> K;
int<lower=1> P;
vector[N] y;
real freq[N];
real logMR[N];
}
parameters {
vector[K] par;
real<lower=0> sigma;
vector<lower=0> [K] sigma_b;
vector<lower=0> [P] sigma_a;
matrix[J,K] b;
matrix[M,P] a;
}
model {
par[1] ~ normal(-2.79, 0.7); // logfc1
par[2] ~ normal(-0.34, 1.5); // logfc2
par[3] ~ normal(0.7, 0.4); // logn1
par[4] ~ normal(0.7, 0.4); // logn2
par[5] ~ normal(0, 0.4); // dlogMR
sigma_b ~ cauchy(0, 2.5);
sigma_a ~ cauchy(0, 2.5);
for (m in 1:M)
  a[m] ~ normal(0, sigma_a);
for (j in 1:J)
  b[j] ~ normal(0, sigma_b);
for (n in 1:N)
  y[n] ~ normal(logMR[n] + par[5] + b[eq[n], 5] + 0.5 * log(1 + (freq[n] / (exp(par[2] + b[eq[n], 2]))) ^ (exp(par[4] + b[eq[n], 4]) * 2)) - 0.5 * log(1 + (freq[n] / exp(par[1] + b[eq[n], 1] + a[sph[n], 1])) ^ (exp(par[3] + b[eq[n], 3] + a[sph[n], 2]) * 2)), sigma);
}
