class Stock
    require 'rest-client'

    def initialize(symbol)
        @symbol = symbol
        @response = JSON.parse(RestClient.get("https://cloud.iexapis.com/stable/stock/#{@symbol}/quote?token=#{Rails.configuration.SECRET_KEY}"))
    end

    def get_quote_name
        @response["companyName"]
    end

    def get_quote_price
        @response["latestPrice"]
    end


    def buy_stock(shares)
        @shares = shares
        @name = get_quote_name()
        @total = get_quote_price().to_f
        @symbol = @response["symbol"]
        
        @user = User.find_by(id: session[:user_id])

        if @user["cash"] < shares * @total
            return "insufficient funds"
        end
        
        newCash = @user["cash"] - (@total * @shares)
        @user.update(cash: newCash)
        @portfolio = Portfolio.new(
                symbol: @symbol,
                user_id: @user["id"],
                total: @total,
                name: @name,
                shares: @shares)
        return @portfolio
    end
end