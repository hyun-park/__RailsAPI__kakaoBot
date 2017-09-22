Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   get '/keyboard' => 'chats#keyboard_init'
  get '/keyboard' => 'chats2#keyboard_init'
  post '/message' => 'chats2#chat_control'
end
