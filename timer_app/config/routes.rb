Rails.application.routes.draw do

#  get 'post/detail'

  get '/' => 'home#top'

  #概要画面
  get 'about' => 'home#about'

  #####学習記録に関するコントローラと対応ビュー
  #詳細画面
  get 'posts/detail' =>  'post#detail'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
