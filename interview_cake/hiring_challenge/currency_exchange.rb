require 'pry'
input = {"USD_JPY": "100.9263037", "USD_USD": "1.0000000", "JPY_EUR": "0.0077004", "BTC_USD": "103.6385704", "JPY_BTC": "0.0000823", "USD_EUR": "0.7662633", "EUR_USD": "1.4640335", "EUR_JPY": "150.0020031", "JPY_USD": "0.0098989", "BTC_BTC": "1.0000000", "EUR_BTC": "0.0128179", "BTC_JPY": "10609.0881372", "JPY_JPY": "1.0000000", "BTC_EUR": "76.4464409", "EUR_EUR": "1.0000000", "USD_BTC": "0.0081777"}

exchange_rates = input.keys

currency_types = []

exchange_rates.each do |currency|
	currency_types << currency[0..2]
end

currency_types = currency_types.uniq
num_of_currency_types_except_us = currency_types.length


currency_types.each do |currency|
	if currency != "USD"
		currency_types.each do |currency|
			
		end		
	end 
end
#[USD_currency1, currency1_USD]
#[USD_currency1, currency1_currency2, currency2_USD]
#[USD_currency1, currency1_currency3, currency3_USD]
#[USD_currency1, currency1_currency2, currency2_currency3, currency3_USD]
#[USD_currency1, currency1_currency3, currency_3_currency2, currency2_USD]

#[USD_currency2, currency2_USD]
#[USD_currency2, currency2_currency1, currency1_USD]
#[USD_currency2, currency2_currency1, currency1_currency3, currency3_USD]

#[USD_currency3, currency3_USD]
#[USD_currency3, currency3_currency1, currency1_USD]

#[USD_currency_1, currency1_currency2, currency_2_currency3, curreny3_USD]

binding.pry