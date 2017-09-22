Rails.application.routes.draw do
  
  #기본
  # get '/keyboard' => 'basic#keyboard_init'
  # post '/message' => 'basic#chat_control'
  
  # 뉴스 검색 기능
  # get '/keyboard' => 'news#keyboard_init'
  # post '/message' => 'news#chat_control'
  
  # 회원 가입 기능
  get '/keyboard' => 'users#keyboard_init'
  post '/message' => 'users#chat_control'
end
