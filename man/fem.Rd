\name{fem}
\alias{fem}

\title{
The Fisher-EM algorithm
}
\description{
The fem() function is the estimation procedure relative to DLM models based on traditional EM algorithm.
Fisher-EM algorithm is divided into three steps. The F step estimates the orientation matrix of the discriminative
latent space conditionally to the posterior probalities. The E step computes the posterior probabilities of 
each observations. The M step updates the parameters of the Mixture model (mean, prior probabilities).
}
\usage{
fem(Y, K, init = "random", maxit = 100, eps = 1e-06, Tinit = c(), model = "AkjBk",kernel='')
}


\arguments{
  \item{Y}{
A matrix or a data frame of observations, assuming the rows are the 
observations and the columns are the variables. Note that NAs are currently not allowed.
}
  \item{K}{
The number of groups
}
  \item{init}{
A character string or a vector of class. It is the way to initialize the E-M algorithm.
The default initialization is "random": the most appropriate parameter values and the 
number of components in the mixture are randomly given.
However there are five ways of initialization:
\itemize{
\item "param": it is initialized with the parameters, the means being generated by a multivariate 
normal distribution and the covariance matrix being common to the whole sample. 
\item "mini-em": it is an initialization strategy, the classes are randomly initialized and 
the E-M algorithm makes several iterations, this action is repetead a few times, at the end,
the initialization choosen is the one which maximize the log-likelihood. 
\item "kmeans": the classes are initialized using the kmeans algorithm.
}
}
  \item{maxit}{
The maximum number of iterations allowed 
}
  \item{eps}{
A positive double. It is the stop criterion: the algorithm stops when the difference between two successive Log Likelihoods is lower than eps
}
  \item{Tinit}{
Initialization of posterior probability (tik) that each observation xi in the latent space is belonging to the class K
}
  \item{model}{
The models used with the Fisher-EM algorithm are the following : "AkjBk","AkjB", "AkBk", "AkB", "AjBk", "AjB", "ABk",
"AB", "DkBk", "DkB", "DBk", "DB".

Akj are the parameters of the classes subspaces : 
\itemize{ 
\item  if Akj : each class have its parameters and there is one parameter for each dimension
\item  if Ak : the classes have different parameters but there is only one per class
\item if Aj : all the classes have the same parameters for each dimension (it's a particular case with a common orientation matrix)
\item  if A : all classes have the same one parameter}
Bk are the noises of the classes subspaces : 
\itemize{  
\item if Bk : each class have its proper noise
\item if B : all classes have the same noise}
Dk is the intrinsic dimension of each class : 
\itemize{ 
\item if Dk : the dimensions are free and proper to each class
\item if D : the dimension is common to all classes}
}
  \item{kernel}{kernel}
}



\value{
\item{cls}{the vector of the class of each observation, its type can be numeric or string}
\item{P}{a posterior probability (tik) that each observation xi in the latent space is belonging to the class K}
\item{prms}{vector of values of M step}
\item{K}{the number group}
\item{p}{the dimensionality of the original space}
\item{mean}{the mean vector}
\item{my}{the mean in observed space}
\item{prop}{the vector of K dimension which describes the proportion of each estimated class}
\item{D}{dimension of the low dimensional subspace}
\item{Model}{the name of the used model}
\item{V}{vector of values of F step or, in other words, the transformation matrix that enables the passage from the observation space to 
latent space by computing the discriminant axis.
It is a basis of the orthogonal subspace according to Gram-Schmidt orthonormalizationn procedure.}
\item{aic}{the AIC value of the used model}
\item{bic}{the BIC value of the used model}
\item{icl}{the ICL criterion}
\item{loglik}{loglikelihood for each iteration}
\item{ll}{max log-likelihood}
}
\references{
C.Bouveyron and C.Brunet, Simultaneous model-based clustering and visualization in the Fisher discriminative subspace, Statistics and Computing, to appear, 2011
}
\author{
J.Loisel  T.Souvannarath  M.Tchebanenko  C.Bouveyron  C.Brunet
}

\examples{
Y<-iris[,1:4]
obj<-fem(Y,3,model='AkB')
plot.fem(obj,loglik=FALSE)
cls=as.numeric(iris[,5])
res=eval.fem(obj,cls,disp=1)
}

