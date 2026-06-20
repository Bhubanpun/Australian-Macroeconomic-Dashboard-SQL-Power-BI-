--- Create Database and table
create database AustralianEconomy;

/* import flat csv files named
- CashRateMonthly
- QuarterlyCPI
- RealGDPQuarterly
- UnemploymentRateMonthly
*/

--- Data cleaning
select * from QuarterlyCPI; --- qterly CPI of all states including whole australia from 1948 
select * from UnemploymentRateMonthly; ---monthly unemployment from 1978
select * from RealGDPQuarterly; ---qterly reealGDP and calculate GDP growth
select * from CashRateMonthly; ---monthly rate from 1990

--- draft to calculate inflation rate in australia
select Date, CPI, CPI-LAG(CPI, 4) over (order by Date) as Previous_CPI,
	((CPI - LAG(CPI,4) over (order by Date)) / LAG(CPI,4) over (order by Date)) * 100 as InflationRate
from dbo.QuarterlyCPI
where Location = 'Australia';

--- draft to see unemployment in Australia not in states
select * from dbo.UnemploymentRateMonthly
where Location = 'Australia';

-- join table and get needed data
select QuarterlyCPI.Date, Value as UnemploymentRate, CPI,
    ((CPI - LAG(CPI,4) over (order by QuarterlyCPI.Date)) / LAG(CPI,4) over (order by QuarterlyCPI.Date)) * 100 as InflationRate
from QuarterlyCPI
inner join UnemploymentRateMonthly on QuarterlyCPI.Date = UnemploymentRateMonthly.Date
where QuarterlyCPI.Location = 'Australia' and UnemploymentRateMonthly.Location = 'Australia';

--instead of inserting into new table draft1, we can create view, it allows to change data instanlt when first data is updated
create view vw_draft2 as
	select Q.Date, U.Value as UnemploymentRate,r.RealGDP, R.GDPgrowth, C.Interest_Rate, Q.CPI,
		((CPI - lag(CPI, 4) over (order by Q.Date)) / lag(CPI, 4) over (order by Q.Date))*100 as InflationRate,
		sum(RealGDP) over (order by r.Date rows between 3 preceding and current row) as TTMGDP
	from QuarterlyCPI Q
	inner join UnemploymentRateMonthly U on Q.Date = U.Date
	inner join RealGDPQuarterly R on Q.Date = R.Date
	inner join CashRateMonthly C on Q.Date = C.Date
	where Q.Location = 'Australia' and U.Location = 'Australia';


---update CPI new quarter
insert into QuarterlyCPI (Date, Location, CPI) values ('2026-03-01', 'Australia', 101.70);


select * from vw_draft2;




