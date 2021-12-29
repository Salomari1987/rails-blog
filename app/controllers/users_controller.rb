class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    
    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to @user
        else
            render :edit
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            flash[:notice] = "User created successfully"
            redirect_to @user
        else
            render :new
        end
    end

    private

        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end
