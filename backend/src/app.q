/ money exchange
gbpToEur: 1.15
usdToEur: 0.88

/ open port 
/ system "p 5000"

/ load data
transactions: get `:../data/mock_data
/ show transactions

eurTransactions: update amount:gbpToEur*amount from transactions where currency=`gbp
eurTransactions: update amount:usdToEur*amount from eurTransactions where currency=`usd
eurTransactions: update currency:`eur from eurTransactions
show eurTransactions

/ get total number of trasactions
count_transactions:{[] count transactions[`id]}
/ count_transactions[]

/ get number of transactions in a city
count_transactions_of_city:{[city]
	result:select total:count id from transactions where location=city;
    result[0][`total]}
/ count_transactions_of_city[`NY]

/ get a list with every city and the number of transactions
count_transactions_per_city:{[] 
	result:select count id by location from transactions; 
    result:`id xasc result; 
    csv 0: result}
/ count_transactions_per_city[]

/ get total amount in one location
get_amount:{[city]
	result:select sum amount from eurTransactions where location=city;
    result[0][`amount]}
/ get_amount[`paris]

/ get spendings trend overall
get_trend:{[]
	result:select sum amount by `month$date from eurTransactions;
    result:select amount from result;
    result[`amount]}
/ get_trend[]

/ get trend for a specified city
/ TODO

/ best merchant in every city
/ TODO

/ tracking user 
/ TODO

/ same time, same user diffrent city ALERT!
get_alert:{[user]
    aux: select numberOfLocations:count distinct location, locations:location by date from transactions where user_id=user;
    r: select locations, date from aux where numberOfLocations>1;
    row: r 0;
    "$(row`locations), $(row`date)"} / TODO: fix it

/ favorite currency for every city
/ TODO

/ exit 0
