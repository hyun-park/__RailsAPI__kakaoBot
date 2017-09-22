class NewsController < ApplicationController
    def keyboard_init
        @msg =
            {
              type: "buttons",
              buttons: ["뉴스 검색 시작하기"]
            }
        render json: @msg, status: :ok
    end
    
    def chat_control
        @response = params[:content]
        @user_key = params[:user_key]
        if @response == "뉴스 검색 시작하기"
            @msg = {
              message: {
                  text: "어떤 키워드로 검색을 하시겠어요?"
              },
              keyboard: {
                type: "text"
              }
            }
            render json: @msg, status: :ok
        elsif @response.include? "[기사]"
            @msg = {
              message: {
                  text: "어떤 키워드로 검색을 하시겠어요?"
              },
              keyboard: {
                type: "text"
              }
            }
            render json: @msg, status: :ok
        else
            @naverApi = HTTParty.get("http://newsapiserver.herokuapp.com/news?keyword=#{URI.escape(@response)}")
            @buttons = []
            @naverApi.parsed_response["items"].each do |item|
                @buttons << "[기사]#{item["title"]}"
            end
            @msg = 
            {
              message: {
                  text: "어떤 키워드로 검색을 하시겠어요?"
              },
              keyboard: {
                  type: "buttons",
                  buttons: @buttons
              }
            }
            render json: @msg, status: :ok
        end
    end
end
