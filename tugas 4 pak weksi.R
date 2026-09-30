#1 
lambda <- 3
x <- 5:10
pmf <- dpois(x, lambda)
plot(x, pmf, type='h', lwd=3, main='Poisson(λ=3)', xlab='k', ylab='P(X=k)')

#2
N <- 100
K <- 20
n <- 10

# Domain k
k <- seq(from = max(0, n + K - N), to = min(n, K))

# PMF: P(X = k)
pmf <- dhyper(k, m = K, n = N - K, k = n)
data.frame(k = k, P = pmf)

plot(k, pmf, type = "b", lwd = 3,
     main = paste("Hypergeometric(N=",N,", K=",K,", n=",n,")"),
     xlab = "k (banyak sukses dalam sampel)", ylab = "P(X=k)")

#3
n <- 15
p <- 0.4
k <- 0:n

# PMF Teoretis & Simulasi
pmf <- dbinom(k, size = n, prob = p)

set.seed(123)
simulasi <- rbinom(1000, size = n, prob = p)

# Histogram Hasil Simulasi
hist(simulasi, 
     breaks = (0:(n + 1)) - 0.5, 
     freq = FALSE, 
     col = "lightblue", 
     border = "white",
     main = "Simulasi Binomial (n=15, p=0.4) vs PMF Teoretis",
     xlab = "k", 
     ylab = "P(X=k)")

# Garis PMF Teoretis
lines(k, pmf, type = "h", col = "red", lwd = 2)