# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

# Quick Tips:
# You need to buy before you can sell.
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

# EVERYTHING BELOW (INCLUDING COMMENTS) WEREN'T PROVIDED

# To solve this I have to ask myself a lot of questions.
# How do I determine the best day to buy and sell the stock?
# Well, the best days to buy and sell would provide me with the GREATEST returns
# This means I must SUBTRACT the buying price FROM the selling price (selling_price - buying price)
# When I iterate of the array of prices, how would I set this up logically?
# Of course I would have to start off with the price on Day 0
# Then I would have to iterate over the array again starting at the NEXT day, find the difference between the current day's price and the price I bought it for
# I would then store that value for all the other daily price comparisons
# Everytime I find the difference between the selling and buying price, I have to compare it to the previous difference in prices (using the stored value)
# If the new difference in price was higher, then I replace the old one with the new returns
# This cycle would repeat itself for every potential buying and and selling day until only the greatest returns remain.

# By simply looking at the array of prices, it's easy to see that the best day to buy is Day 1 ($3) and the best day to sell is Day 4 ($15)

# Create an array that represents the stock prices
stock_prices = [17,3,6,9,15,8,6,1,10] # Each index of the array represents the day itself

def stock_picker(stock_price_array)
  best_returns = 0 
  best_buying_and_selling_days = []

  stock_price_array.each do |buying_price|

    stock_index = stock_price_array.index(buying_price)

    # The drop method returns an array containing all but the first 'n' elements! (enumerable)
    stock_price_array.drop(stock_index + 1).each do |selling_price|
      profits = selling_price - buying_price
      if profits > best_returns
        best_returns = profits
        best_buying_and_selling_days[0] = stock_price_array.index(buying_price)
        best_buying_and_selling_days[1] = stock_price_array.index(selling_price)
      end
    end
  end
  return best_buying_and_selling_days
end

print stock_picker(stock_prices)
