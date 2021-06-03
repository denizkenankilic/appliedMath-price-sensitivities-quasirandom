# appliedMath-price-sensitivities-quasirandom
Price Sensitivities &amp; Quasirandom Numbers

In this repository there are explanations and scripts of two important topics used in methods of computational finance. Stated two topics, whose details are given in the presentation file "**americanop&pricesen.pdf**" , are:
* **Monte Carlo calculation of option price sensitivities**

  Price sensitivities are calculated according to different metrics and each sensitivity calculation is associated with an unique Greek symbol. The most popular      Greeks are obtained from the Black-Scholes formula.

  * Matlab code for implementing the Vega for geometric Brownian motion for European Call and Put options: **PW_Vega_CallPut.m**
  * Matlab code for calculation of the delta and gamma using the likelihood ratio method (includes dividend): **EurLik.m**
  * Matlab code for calculation of the delta and gamma using the finite difference method: **finitedif.m**
  * Black-Scholes digital call option solution: **digital_call.m**
  * Likelihood calculation by using "digital_call.m" (not includes dividend): **likelihood.m**
 
* **Quasirandom Sequences**

  The quasirandom sequence of numbers looks like random numbers because it looks unpredictable. However, they are deterministic alternative to random sequences for use in Monte Carlo methods.
  * R code for simulating quasirandom sequences: **quasirandom.R**
