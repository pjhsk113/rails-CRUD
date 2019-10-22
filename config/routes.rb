Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get '/home', to: 'home#index'
	get '/boardList', to: 'home#boardList'
	get '/boardWrite', to: 'home#boardWrite'
	get '/WriteOk', to: 'home#WriteOk'
	get '/boardEdit/:board_id', to: 'home#boardEdit'
	get '/EditOk/:board_id', to: 'home#EditOk'
	get '/boardDelete/:board_id', to: 'home#boardDelete'
end
