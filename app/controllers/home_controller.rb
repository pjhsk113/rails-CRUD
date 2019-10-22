class HomeController < ApplicationController
	def index
		
	end
	def boardList
		@board = Board.all
	end
	
	def boardWrite
		
	end
	
	def WriteOk
		board = Board.new
		board.title = params[:title]
		board.content = params[:content]
		board.save
		
		redirect_to '/boardList'
	end
	
	def boardEdit
		@board = Board.find(params[:board_id])
	end
	
	def EditOk
		board = Board.find(params[:board_id])
		board.title = params[:title]
		board.content = params[:content]
		board.save
		
		redirect_to '/boardList'
	end
	
	def boardDelete
		Board.destroy(params[:board_id])
		
		redirect_to '/boardList'
	end
end
