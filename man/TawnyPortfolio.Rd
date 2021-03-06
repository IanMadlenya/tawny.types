\name{TawnyPortfolio}
\alias{TawnyPortfolio}
\alias{BenchmarkPortfolio}
\alias{PortfolioReturns}
\alias{start.TawnyPortfolio}
\alias{end.TawnyPortfolio}
\alias{rollapply.TawnyPortfolio}
\alias{window_at}
\title{ Create a TawnyPortfolio object }
\description{
  Represents a portfolio. Contains information about the portfolio composition,
  returns, window, etc.
}
\usage{
TawnyPortfolio(...)
BenchmarkPortfolio(...)

\method{start}{TawnyPortfolio}(x, ...)

\method{end}{TawnyPortfolio}(x, ...)

\method{rollapply}{TawnyPortfolio}(x, fun, ...)

window_at(...)
}
\arguments{
  \item{x}{A TawnyPortfolio}
  \item{fun}{A function to apply against the TawnyPortfolio}
  \item{\dots}{ Arguments to the constructor. See below for details }
}
\details{
This type is governed by futile.paradigm. Below are the supported function
variants.

TawnyPortfolio(returns, window = 90)

TawnyPortfolio(symbols, window = 90, obs = 150)

Creates a benchmark portfolio to compare with the actual portfolio.

BenchmarkPortfolio(symbol, window = 90, obs = 150, end = Sys.Date(), ...)

Calculates portfolio returns based on the weights calculated.

PortfolioReturns(p, weights), p is a TawnyPortfolio

PortfolioReturns(h, weights), h is an AssetReturns object or zoo


'start' and 'end' operate on a TawnyPortfolio to return the start and end
dates, respectively, of the portfolio. 

'rollapply' is the implementation of the zoo function for a TawnyPortfolio. The
'window_at' function supports this by providing a window of the portfolio for 
the given index.

}
\value{
The type constructor returns a TawnyPortfolio.

The 'start' and 'end' functions return dates.

'window_at' returns a modified TawnyPortfolio that only contains returns for the
given window. All other data is the same, and the original object is unchanged.
}
\author{
Brian Lee Yung Rowe
}

\examples{
  \dontrun{
  p <- TawnyPortfolio(c('BAC','JPM','C','GS','MS'))

  start(p)
  end(p)

  window_at(p, 2)
  rollapply(p, function(x) colSums(x$returns))
  }
}
