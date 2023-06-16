// theta is distributed half-normal (and uniform hyperpriors)

data {
  int<lower=0>  J;       
  real          y[J];    
  real<lower=0> sigma[J];
}

parameters {
  real<lower=0> tau;
  real<lower=0> theta[J];
  real<lower=0> theta_new;
}

transformed parameters {
  real mean_effect;
  mean_effect = tau*(2^0.5)/(3.14159^0.5);
}

model {
  tau ~ uniform(0,5);
  theta ~ normal(0,tau);
  y ~ normal(theta,sigma);
  theta_new ~ normal(0,tau);
}

