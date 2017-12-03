Stan code for empirical Green's function analysis of the Kumamoto earthquake, as analysed in Van Houtte and Denolle (2018), JGR: Solid Earth.

Input:
- N: number of data points
- J: number of EGF events
- M: number of focal sphere bins
- eq: id of EGF event
- sph: id of focal sphere bin
- K: number of parameters with EGF-level effects
- P: number of parameters with focal sphere effects
- y: log of amplitude ratio
- freq: frequency (Hz)
- logMR: ln of catalogue moment ratio

Output:
- par: model parameters
- a: focal sphere effects
- b: EGF effects
- sigma: overall (homoskedastic) standard deviation
- sigma_a: standard deviation of focal sphere level parameters
- sigma_b: standard deviation of EGF level parameters
