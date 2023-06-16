// theta is distributed skew-normal (and uniform hyperpriors)

data {
  int<lower=0>  J;       
  real          y[J];    
  real<lower=0> sigma[J];
}

parameters {
  real mu; 
  real<lower=0> tau;
  real theta_raw[J];
  real theta_new_raw;
  real alpha;
}

transformed parameters {
  real theta[J];
  real theta_new;
  real mean_effect;
  for (j in 1:J) {
    theta[j] = mu + theta_raw[j] * tau;  
  }
  theta_new = mu + theta_new_raw * tau;
  mean_effect = mu + tau*(alpha/((1+alpha^2)^0.5))*((2/3.14159)^0.5);
}

model {
  mu ~ uniform(-5,5);
  tau ~ uniform(0,10);
  alpha ~ normal(0,10);
  theta_raw ~ skew_normal(0,1,alpha);
  y ~ normal(theta,sigma);
  theta_new_raw ~ skew_normal(0,1,alpha);
}

