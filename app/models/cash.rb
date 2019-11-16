class Cash
    def Add(amount)
        @user = User.find_by(id: session[:user_id])
        @cash = @user["cash"] + amount
        @user.update(cash: @cash)
    end

    def Withdraw(amount)
        @user = User.find_by(id: session[:user_id])
        @cash = @user["cash"] - amount
        @user.update(cash: @cash)
    end

    def Get_Total
        @cash = User.find_by(id: session[:user_id])["cash"]
    end
end