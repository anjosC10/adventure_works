# Adventure Works - Modern Analytics Platform

Welcome to the Adventure Works (AW) dbt project! This project is part of a certification challenge focused on implementing a Modern Analytics Stack for AW, a growing bicycle manufacturer with over 500 products, 20,000 customers, and 31,000 orders.

## Project Overview

The goal of this project is to design and implement a modern analytics platform that allows AW to become a data-driven company. Starting with the sales area, we will model the data to answer key business questions that have been outlined by the leadership team.

## Objectives

- Develop a dimensional data model (fact and dimension tables) that supports strategic decision-making, starting with the sales area.
- Ensure data accuracy by validating key metrics, such as 2011 gross sales of $12,646,112.16, as requested by the CEO.
- Guarantee data quality and alignment with audit findings from the finance department.
- Deliver quick wins to demonstrate the value of the data platform to internal stakeholders.
  
## dbt Project Setup

To get started with this dbt project, run the following steps:

- Create your .env file based on .env_example (.env_windows_example if you're using Windows OS) and fill with your informations.
- Run source .env in command line (if you're using Windows OS, copy and paste your .env file in the command line, will work too).
- Run dbt debug to check the connection.
