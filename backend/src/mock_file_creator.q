size: 10000
max_user_number: 250
neg_size: -10000
ids: neg_size?0Ng
user_ids:size?max_user_number
amounts: 90.0+(size?9999)%100
currencies: size?`eur`usd`gbp
merchants: size?`amazon`starbucks`stripe`google`uber`emag`brd`bestbuy`rent
locations: size?`bucharest`paris`london`berlin`oslo`NY`cluj`budapesta`dublin`roma`milano`napoli
dates: size?2015.01.01+1000000?900
times: size?24:00:00.000000000

transactions:([] id:ids; user_id:user_ids; amount:amounts; currency:currencies; merchant:merchants; location:locations; date:dates; time:times)

`:../data/mock_data set transactions

show transactions

exit 0
