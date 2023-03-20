class UsersController < ApplicationController
  def new
    @user = User.new
    # redirect_to users_path
  end

  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email])
    # binding.pry
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def index
  #   puts 'ここ'
  #   p @user
  # end  

end
