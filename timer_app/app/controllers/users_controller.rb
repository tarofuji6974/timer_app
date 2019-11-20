class UsersController < ApplicationController
  def index
    #全ユーザー情報を取得
    @users = User.all.order(created_at: :desc)
  end


  def new
    #新規ユーザー登録
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      password_digest: params[:password_digest]
    )

    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"

      #ユーザー詳細画面へのリンクに変更予定。後日実装
      redirect_to("/")
    else

      render("/users/new")
    end
  end
end
