class Stock
    require 'rest-client'

    def initialize
        @symbol = symbol.upcase
        @response = RestClient.get("https://cloud.iexapis.com/stable/stock/#{@symbol}/quote?token=#{stockApiSecret}")
    end

    def get_quote_name
        @response["companyName"]
    end

    def get_quote_price
        @response["latestPrice"]
    end

    def get_quote_price_open
        @response["open"]
    end

end