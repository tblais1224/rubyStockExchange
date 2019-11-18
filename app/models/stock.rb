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
        @response["latestPrice"].round(2)
    end


    def buy_stock(shares, user_id)
        @shares = shares
        @name = get_quote_name()
        @total = get_quote_price().to_f
        @symbol = @response["symbol"]
        @user = User.find_by(id: user_id)
        if @user["cash"] < shares * @total
            return "insufficient funds"
        end
        newCash = (@user["cash"] - (@total * @shares)).round(2)
        @user.cash = newCash
        @user.save(:validate => false) 
        @portfolio = Portfolio.find_by(user_id: user_id, symbol: @symbol)
        if @portfolio
            @shares += @portfolio.shares
            @portfolio.update(shares: @shares)
        else
            @portfolio = Portfolio.new(
                symbol: @symbol,
                user_id: @user["id"],
                name: @name,
                shares: @shares)
            @portfolio.save
        end
        return @portfolio
    end

    def sell_stock(shares, user_id)
        @symbol = @response["symbol"]
        @total = get_quote_price().to_f
        @user = User.find_by(id: user_id)
        @portfolio = Portfolio.find_by(user_id: user_id, symbol: @symbol)
        if @portfolio.shares < shares
            return false
        end
        @shares = @portfolio.shares - shares
        if @shares === 0
            Portfolio.find(@portfolio.id).destroy
        else
            @portfolio.update(shares: @shares)
        end
        newCash = (@user["cash"] + (@total * @shares)).round(2)
        @user.cash = newCash
        @user.save(:validate => false) 
        return @portfolio
    end
    
end