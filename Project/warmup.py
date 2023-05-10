import pylab as pb
import numpy as np
from math import pi
from scipy.spatial.distance import cdist

# Set the generating parameters
w0 = 0.5
w1 = -1.5
sigma = 0.2

# Create the input data points
x = np.arange(-1, 1.01, 0.01)

# Create the target values
noise = np.random.normal(0, sigma, len(x))
t = w0*x + w1 + noise

# Prior distribution over W
mu_prior = np.array([0, 0])
sigma_prior = np.array([[1, 0], [0, 1]])
prior_samples = np.random.multivariate_normal(mu_prior, sigma_prior, 5)

# Visualize the prior distribution over W
pb.figure()
pb.plot(prior_samples[:,0], prior_samples[:,1], 'o')
pb.xlabel('$w_0$')
pb.ylabel('$w_1$')
pb.title('Prior Distribution over $w_0$ and $w_1$')
pb.show()

# Pick a single data point (x,t) and visualise the posterior
selected_x = 0.5
selected_t = t[np.where(x==selected_x)]
X = np.array([[1, selected_x]])
sigma_noise = sigma**2*np.identity(len(selected_x))
sigma0_inv = np.linalg.inv(sigma_prior)
sigma_post = np.linalg.inv(sigma0_inv + X.T.dot(X)/sigma_noise)
mu_post = sigma_post.dot(sigma0_inv.dot(mu_prior) + X.T*selected_t/sigma_noise)
posterior_samples = np.random.multivariate_normal(mu_post, sigma_post, 5)

# Visualize the posterior distribution over W
pb.figure()
pb.plot(prior_samples[:,0], prior_samples[:,1], 'o', label='Prior')
pb.plot(posterior_samples[:,0], posterior_samples[:,1], 'ro', label='Posterior')
pb.xlabel('$w_0$')
pb.ylabel('$w_1$')
pb.title('Prior and Posterior Distribution over $w_0$ and $w_1$')
pb.legend(loc='best')
pb.show()

# Draw 5 samples from the posterior and plot the resulting functions
X_grid = np.array([np.ones(len(x)), x])
for i in range(5):
    samples = posterior_samples[i,:]
y = np.dot(samples, X_grid)
pb.plot(x, y, label='Sample '+str(i+1))
pb.plot(x, t, 'o', label='Data')
pb.xlabel('x')
pb.ylabel('y')
pb.title('Prediction from Posterior Samples')
pb.legend(loc='best')
pb.show()

# Add additional data points
X = np.array([np.ones(len(x)), x]).T
selected_indices = [1, 20, 40, 60, 80, 100, 120]
selected_x = x[selected_indices]
selected_t = t[selected_indices]
sigma_noise = sigma**2*np.identity(len(selected_x))
for i in range(len(selected_indices)):
    X_train = X[:selected_indices[i],:]
    t_train = selected_t[:selected_indices[i]]
sigma0_inv = np.linalg.inv(sigma_prior)
sigma_post = np.linalg.inv(sigma0_inv + X_train.T.dot(X_train)/sigma_noise[:i+1,:i+1])
mu_post = sigma_post.dot(sigma0_inv.dot(mu_prior) + X_train.T.dot(t_train)/sigma_noise[:i+1,:i+1])
posterior_samples = np.random.multivariate_normal(mu_post, sigma_post, 5)

# Visualize the posterior distribution over W
pb.figure()
pb.plot(prior_samples[:,0], prior_samples[:,1], 'o', label='Prior')
pb.plot(posterior_samples[:,0], posterior_samples[:,1], 'ro', label='Posterior')
pb.xlabel('$w_0$')
pb.ylabel('$w_1$')
pb.title('Prior and Posterior Distribution over $w_0$ and $w_1$ with '+str(i+1)+' data points')
pb.legend(loc='best')
pb.show()

# Draw 5 samples from the posterior and plot the resulting functions
X_grid = np.array([np.ones(len(x)), x])
for j in range(5):
    samples = posterior_samples[j,:]
y = np.dot(samples, X_grid)
pb.plot(x, y, label='Sample '+str(j+1))
pb.plot(x, t, 'o', label='Data')
pb.xlabel('x')
pb.ylabel('y')
pb.title('Prediction from Posterior Samples with '+str(i+1)+' data points')
pb.legend(loc='best')
pb.show()