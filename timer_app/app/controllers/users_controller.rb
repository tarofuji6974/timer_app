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
    #新規ユーザー登録アクション
    @user = User.new(
      name: params[:name],
      password_digest: params[:password_digest]
    )

    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"

      #ユーザー詳細画面へのリンクに変更予定。後日実装
      redirect_to("/")
    else
      #登録失敗の場合、ページ遷移させない
      render("/users/new")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    #ユーザーの個別情報を取得
    @user = User.find_by(id:params[:id])
  end

end
