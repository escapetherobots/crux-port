class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin
  
  def index
    @users = User.all
  end
  
  # def edit
  #   #see before_action for @user above
  # end
  
  # def update
  #   #see before_action for @user above
  #   if @user.update(user_params)
  #     flash[:success] = "Your account was updated!"
  #     redirect_to articles_path
  #   else
  #     render 'edit'
  #   end
  # end
  
  # def show
  #   #see before_action for @user above
  #   @user_articles = @user.articles.paginate(page: params[:page], per_page: 3)
  # end
  
  def destroy
    @user.destroy
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to users_path
  end
  
  
  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
      #general name of the params object being passed in to require method!
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def require_same_user
      if  current_user != @user and !current_user.admin?
        flash[:danger] = "You are not the user we are looking for"
        redirect_to user_path
      end
    end
    
    def require_admin
      if user_signed_in? and !current_user.admin?
        flash[:danger] = "Only admins can do that"
        redirect_to root_path
      end
    end
  
end
