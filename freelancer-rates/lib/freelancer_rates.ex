defmodule FreelancerRates do

  @working_days 22.0
  @hours_per_day 8.0

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_per_day
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    old_price = @hours_per_day * @working_days * hourly_rate
    trunc(Float.ceil(apply_discount(old_price, discount)))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount), 1)
  end
end
