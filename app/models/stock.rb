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

    def buy_stock?(shares)
        #shares name total(buy price) symbol userid
        @portfolio = Portfolio.new(buy_stock_params(shares))
        if @portfolio.save
            return true
        else
            return false
        end
    end

    private def buy_stock_params(shares)
        @portfolio = new Portfolio(
            @response["symbo"],
            get_quote_name(),
            shares.to_i,
            get_quote_price().to_f
        )
        puts @portfolio
    end

end