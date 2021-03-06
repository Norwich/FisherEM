\name{fem}
\alias{fem}

\title{
The Fisher-EM algorithm
}
\description{
The Fisher-EM algorithm is a subspace clustering method for high-dimensional data. It is based on the Gaussian Mixture Model and on the idea that the data lives in a common and low dimensional subspace. An EM-like algorithm estimates both the discriminative subspace and the parameters of the mixture model.
}
\usage{
fem(Y,K=2:6,model='AkjB',method='reg',crit='icl',maxit=50,eps=1e-6,init='kmeans',
	nstart=25,Tinit=c(),kernel='',disp=F)
}
\arguments{
  \item{Y}{ 
The data matrix. Categorical variables and missing values are not allowed.
}
  \item{K}{
An integer vector specifying the numbers of mixture components (clusters) among which the model selection criterion will choose the most appropriate number of groups. Default is 2:6.
}
 \item{model}{A vector of discriminative latent mixture (DLM) models to fit. There are 12 different models: "DkBk", "DkB", "DBk", "DB", "AkjBk", "AkjB", "AkBk", "AkBk", "AjBk", "AjB", "ABk", "AB".  The option "all" executes the Fisher-EM algorithm on the 12 DLM models and select the best model according to the maximum value obtained by model selection criterion. 
} 
 \item{method}{
The method use for the fitting of the projection matrix associated to the discriminative subspace. Three methods are available: 'svd', 'reg' and 'gs'. The 'reg' method is the default.
}
   \item{crit}{The model selection criterion to use for selecting the most appropriate model for the data. There are 3 possibilities: "bic", "aic" or "icl". Default is "icl".
}
  \item{maxit}{
The maximum number of iterations before the stop of the Fisher-EM algorithm. 
}
  \item{eps}{
The threshold value for the likelihood differences to stop the Fisher-EM algorithm.
}
  \item{init}{
The initialization method for the Fisher-EM algorithm. There are 4 options: "random" for a randomized initialization, "kmeans" for an initialization by the kmeans algorithm, "hclust" for hierarchical clustering initialization or "user" for a specific initialization through the parameter "Tinit". Default is "kmeans". Notice that for "kmeans" and "random", several initializations are asked and the initialization associated with the highest likelihood is kept (see "nstart").
}
 \item{nstart}{The number of restart if the initialization is "kmeans" or "random". In such a case, the initialization associated with the highest likelihood is kept.
}
  \item{Tinit}{
A n x K matrix which contains posterior probabilities for initializing the algorithm (each line corresponds to an individual).
}
  \item{kernel}{It enables to deal with the n < p problem. By default, no kernel (" ") is used. But the user has the choice between 3 options for the kernel: "linear", "sigmoid" or "rbf".
}
  \item{disp}{
If true, some messages are printed during the clustering. Default is false.
}
}


\value{
A list is returned: 
  \item{K}{The number of groups.}
  \item{cls}{the group membership of each individual estimated by the Fisher-EM algorithm.}
  \item{P}{the posterior probabilities of each individual for each group.}
  \item{U}{The loading matrix which determines the orientation of the discriminative subspace.}
  \item{mean}{The estimated mean in the subspace.}
  \item{my}{The estimated mean in the observation space.}
  \item{prop}{The estimated mixture proportion.}
  \item{D}{The covariance matrices in the subspace.}
  \item{aic}{The value of the Akaike information criterion.}
  \item{bic}{The value of the Bayesian information criterion.}
  \item{icl}{The value of the integrated completed likelihood criterion.}
  \item{loglik}{The log-likelihood values computed at each iteration of the FEM algorithm.}
  \item{ll}{the log-likelihood value obtained at the last iteration of the FEM algorithm.}
  \item{method}{The method used.}
  \item{call}{The call of the function.}
  \item{plot}{Some information to pass to the plot.fem function.}
  \item{crit}{The model selction criterion used.}
}
\references{Charles Bouveyron and Camille Brunet (2012), Simultaneous model-based clustering and visualization in the Fisher discriminative subspace,
        Statistics and Computing, 22(1), 301-324.

	    Charles Bouveyron and Camille Brunet (2013), "Discriminative variable selection for clustering with the sparse Fisher-EM algorithm",
        Computational Statistics, to appear.
}
\author{
Charles Bouveyron and Camille Brunet
}

\seealso{sfem, plot.fem, fem.ari, summary.fem}

\examples{
data(iris)
res = fem(iris[,-5],K=2:5,model='AkB')
summary(res)
plot(res)
fem.ari(res,as.numeric(iris[,5]))
}
