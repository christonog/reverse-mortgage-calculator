require 'sinatra'

get '/' do

	erb :calculator	

end

post '/' do

	erb :results

end

get '/about' do

	"a Chris Tonog production"
	
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

