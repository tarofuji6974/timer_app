Rails.application.routes.draw do

  #####homeコントローラ
  #top画面
  get '/' => 'home#top'

  #概要画面
  get 'about' => 'home#about'


  #####userコントローラ
  get 'signup'      => 'users#new'      #ユーザー登録画面の表示
  get 'users/index' => 'users#index'    #ユーザー一覧の表示
  post 'users/create' => 'users#create'  #ユーザー登録アクション
  get 'users/:id' => 'users#show'       #ユーザー詳細情報画面の表示
  get 'users/:id/edit' => 'users#edit'  #ユーザー編集画面の表示
  post 'users/:id/update' => 'users#update' #ユーザー編集アクション
  get 'users/:id/record' => 'users#record'  #学習記録画面の表示
  post 'users/:id/record_create' => 'users#record_create' #学習記録アクション
  get 'users/:id/record_edit' => 'users#record_edit'  #学習記録更新画面の表示
  post 'users/:id/record_update' => 'users#record_update'  #学習記録更新アクション
  post 'users/:id/record_destroy' => 'users#record_destroy' #学習記録削除処理
  get 'login' => 'users#login_form' #ログイン画面の表示
  post 'login' => 'users#login' #ログインアクション
  post 'logout' => 'users#logout' #ログアウトアクション

  #####postコントローラ
  #詳細画面
  get 'posts/detail' =>  'post#detail'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
