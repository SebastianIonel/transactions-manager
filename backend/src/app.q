/ money exchange
gbpToEur: 1.15
usdToEur: 0.88

/ open port 
system "p 5000"

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

/ get total amount in one location TODO: need conversion in one currency
get_amount:{[city]
	result:select sum amount from eurTransactions where location=city;
    result[0][`amount]}
/ get_amount[`paris]

/ get spendings trend overall
get_trend:{[]
	result:select sum amount by `month$date from eurTransactions;
    result:select amount from result;
    result[`amount]}



/ exit 0
