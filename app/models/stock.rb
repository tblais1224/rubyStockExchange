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

end