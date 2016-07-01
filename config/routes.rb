Rails.application.routes.draw do
  resources :widgets
  root 'users#index'

  devise_for :users

  # в профиле юзера показываем его игры, на главной - список лучших игроков
  resources :users, only: [:index, :show]

  resources :games, only: [:create, :show] do
    put 'answer', on: :member # доп. метод ресурса - ответ на текущий вопро
    put 'take_money', on: :member # доп. метод ресурса - игрок берет деньги
  end

  # Ресурс в единственом числе - Вопросы
  # для загрузки админом сразу пачки вопросов
  resource :questions, only: [:new, :create]
end
