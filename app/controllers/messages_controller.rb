class MessagesController < ApplicationController
    before_action :set_message,only:[:delete]
    before_action :set_board

    def create
        @message = Message.new(board_params)
        @message.board = @board
  
        respond_to do |format|
        if @message.save
          format.html { redirect_to @board }
          format.json { render :show, status: :created, location: @message }
        else
          format.html { render :new }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
     end
  
     def destroy
        @board.destroy
        respond_to do |format|
           format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
           format.json { head :no_content }
        end
     end
  
     private
  
     def board_params
        params.require(:message).permit(:creator_name, :message, :del_passwd)
     end
  
     def set_message
        @message = Message.find(params[:id])
     end
  
     def set_board
        @board = Board.find(params[:board_id])
     end
  
end
