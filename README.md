This project analyzes how the February 2021 Arctic cold outbreak impacted energy grid operations in Denver, Colorado.

This fortran 90 program was developed to read upper air sounding data and evaluate weather conditions that could increase energy demand and create operational risks for the power grid.

## Case Study

Location/Date/Time: Denver CO,  02-15-2021, 12 UTC  

The event featured extremely cold temperatures across the region, leading to increased heating demand and challenging operating conditions.

## Data Source

Upper air sounding data was obtained from the University of Wyoming sounding archive.

Station: 72469 - Denver Stapleton International Airport

Variables analyzed:
- Temperature
- Pressure
- Height
- Wind speed
- Wind direction
- Relative humidity

## Program Analysis

The Fortran program calculates:

- Cold Demand Risk
- Wind Operational Risk
- Winter Weather Risk
- Overall Grid Risk

The analysis uses atmospheric conditions from multiple levels of the atmosphere, including:
- Surface
- 700 mb
- 500 mb
