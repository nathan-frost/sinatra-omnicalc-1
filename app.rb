require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:other)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 0.5
  erb(:square_root_results)
end

get("/random/new") do
  erb(:random_calc)
end

get("/random/results") do
  @the_min = params.fetch("user_min").to_f
  @the_max = params.fetch("user_max").to_f
  @the_result = rand(@the_min..@the_max).to_f
  erb(:random_results)
end


get("/payment/new") do
  erb(:payment_calc)
end

get("/payment/results") do

  @the_apr = params.fetch("users_apr").to_f
  @the_years = params.fetch("users_years").to_f
  @the_principal = params.fetch("users_principal").to_f


  a_r = @the_apr/100
  r = a_r / 12
  n = -@the_years*12


  @the_result = ((r * @the_principal) / (1 - ((1+r)**n))).round(2)


  erb(:payment_results)
end
