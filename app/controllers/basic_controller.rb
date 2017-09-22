class BasicController < ApplicationController
    def keyboard_init
        @msg =
            {
              type: "buttons",
              buttons: ["선택 1", "선택 2", "선택 3"]
            }
        render json: @msg, status: :ok
    end
    
    def chat_control
        @response = params[:content]
        @user_key = params[:user_key]
        
        if @response == "선택 1"
            @msg = {
              message: {
                  text: "선택 1을 누르셨습니다. user_key: #{@user_key}"
              },
              keyboard: {
                type: "buttons",
                buttons: ["선택 1", "선택 2", "선택 3"]
              }
            }
            render json: @msg, status: :ok
        elsif @response == "선택 2"
            @msg = {
              message: {
                  text: "선택 2를 누르셨습니다."
              },
              keyboard: {
                type: "buttons",
                buttons: ["선택 1", "선택 2", "선택 3"]
              }
            }
            render json: @msg, status: :ok
        elsif @response == "선택 3"
            @msg = {
              message: {
                  text: "선택 3을 누르셨습니다."
              },
              keyboard: {
                type: "buttons",
                buttons: ["선택 1", "선택 2", "선택 3"]
              }
            }
            render json: @msg, status: :ok
        else
            @msg = {
              message: {
                  text: "잘못된 명령어를 입력하셨습니다."
              },
              keyboard: {
                type: "buttons",
                buttons: ["선택 1", "선택 2", "선택 3"]
              }
            }
            render json: @msg, status: :ok
        end
    end
end
