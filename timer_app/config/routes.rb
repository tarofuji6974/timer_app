Rails.application.routes.draw do

#  get 'post/detail'
  #####homeコントローラ
  #top画面
  get '/' => 'home#top'

  #概要画面
  get 'about' => 'home#about'


  #####userコントローラ
  get 'users/index' => 'users#index'    #ユーザー一覧の表示
  post 'users/create' => 'users#create'  #ユーザー登録アクション
  get 'signup'      => 'users#new'      #ユーザー登録画面の表示

  #####postコントローラ
  #詳細画面
  get 'posts/detail' =>  'post#detail'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
