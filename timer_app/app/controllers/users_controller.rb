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
      password_digest: params[:password_digest],
      image_name: "default_user.png"
    )

    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"

      #ユーザー詳細画面への遷移
      redirect_to("/users/:id")
    else
      #登録失敗の場合、ページ遷移させない
      render("/users/new")
    end
  end

  def show
    #ユーザーの個別情報を取得
    @user = User.find_by(id: params[:id])

    #ユーザーの学習記録情報を取得
    @logs = Log.all.order(created_at: :desc)
  end

  def edit
    #ユーザーの個別情報を取得
    @user = User.find_by(id:params[:id])
  end

  def update
    @user = User.find_by(id:params[:id])
    @user.name = params[:name]
    @user.password_digest = params[:password_digest]

    #画像の保存処理
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"

      image = params[:image]

      File.binwrite("public/user_image/#{@user.image_name}",image.read)
    end

    #ユーザー情報の更新処理
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      #更新に失敗した場合は画面遷移しない
      render("/users/edit")
    end
  end

  def record
    require 'date'
    #ユーザー情報を取得
    @user = User.find_by(id:params[:id])

    #現在日時を取得
    @nowTime = DateTime.now

    @logs = Log.new
  end

  def record_create
    #require 'date'
    #ユーザーIDを取得
    @user = User.find_by(id:params[:id])

    #記録作成
    @logs = Log.new(
      user_id: @user.id,
      user_name: @user.name,
      start_time: params[:start_time],
      menu: params[:menu]
    )

    #記録保存処理
    if @logs.save
      flash[:notice] = "学習を記録しました(開始)"

      #ユーザーページに戻る
      redirect_to("/users/#{@user.id}")
    else
      #失敗時のアクション
      render("/users/record")
    end
  end

  def record_edit
    @logs = Log.find_by(id:params[:id])
  end

  def record_update

    @logs = Log.find_by(id:params[:id])
    @logs.end_time = params[:end_time]
    @logs.menu = params[:menu]

    #学習記録更新処理
    if @logs.save
      flash[:notice] = "学習を記録しました(終了)"

      #ユーザーページに戻る
      redirect_to("/users/#{@logs.user_id}")
    else
      #失敗時のアクション
      render("/users/record_edit")
    end
  end

  def record_destroy
    @logs = Log.find_by(id:params[:id])
    @id = @logs.user_id
    #学習記録を削除
    @logs.destroy

    flash[:notice] = "記録を削除しました"
    redirect_to("/users/#{@id}")
  end
end