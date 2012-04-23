require 'sinatra'

helpers do
	#no idea how the below method reaches the comma thing, copied and pasted from
	#http://johnallen.us/?p=380
	def add_commas_to_number(large_number)
		large_number.to_s =~ /([^\.]*)(\..*)?/
		int, dec = $1.reverse, $2 ? $2 : ""
		while int.gsub!(/(,|\.|^)(\d{3})(\d)/, '\1\2,\3')
		end
		int.reverse + dec
	end
end

get '/' do

	@title = "Reversed Mortgage Calculator"
	erb :home	

end

post '/' do

	@title = "Your results"
	interest_rate = params[:interest_rate].to_f
	
	monthly_payment = params[:monthly_payment].to_i 
	interest_rate_per_period = interest_rate/12.0
	number_of_payments = 360 
	@loan_amount = (monthly_payment/interest_rate_per_period) * (1-(1+interest_rate_per_period)**-360)

	erb :results

end

get '/about' do

	@title = "About the App"
	erb :about

end

=begin
	
A = (P/i)[1 − (1+i)^-N], where

A   	the loan amount (the principal sum) or initial investment
i   	the interest rate per period, not per year
(For instance, if the loan payments are made monthly and the interest rate is 9%, then i = 9%/12 = 0.75% = 0.0075.)
N   	the total number of payments for the entire loan or investment
P   	the amount of each equal payment

to get the 	
=end

