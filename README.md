# LearnOptions

Interactive Chinese options-learning site covering core option mechanics and pricing concepts.

## Contents

This repository is a static HTML site. It does not require a build step or package installation.

- `index.html` - course landing page and lesson index
- `01-call-put.html` - Call / Put recognition and payoff basics
- `02-intrinsic-time.html` - intrinsic value and time value
- `03-moneyness.html` - ITM / ATM / OTM moneyness
- `04-greeks.html` - option Greeks and Black-Scholes sensitivity
- `05-volatility.html` - implied volatility and historical volatility
- `06-payoff.html` - payoff diagrams and multi-leg combinations
- `iv-hv-vega-theta.html` - Module 05 companion: IV/HV, Vega, and Theta indicator with scenario quiz
- `07-parity.html` - put-call parity
- `08-strategies.html` - basic option strategies
- `strategy-system.html` - McMillan strategy system: four-category framework, market×IV selection matrix, and a 20+ strategy gallery with live payoffs
- `delta.html` - Delta standalone interactive lesson
- `gamma.html` - Gamma standalone interactive lesson
- `theta.html` - Theta standalone interactive lesson
- `vega.html` - Vega standalone interactive lesson
- `rho.html` - Rho standalone interactive lesson

## Run

Open `index.html` directly in a browser, or start a local server:

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -File ".\run.ps1" -Port 8000
```

Then visit:

```text
http://localhost:8000/
```

## Notes

- Pages are self-contained with inline styles and scripts.
- The only external runtime dependency is Google Fonts.
- The material is for education and demonstration only, not investment advice.
