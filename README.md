# Ruby on rails CRUD 구현해보기 (Scaffording X)
1. rails g model board 명령어로 Model 생성
1. db -> migrate에 파일이 생성됨(migrate 파일 내용에 따라 DB 테이블 생성)
    - title, content(제목,내용)로 DB 구성
```ruby
class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
	t.string :title
	t.text 	 :content
      t.timestamps
    end
  end
end
```
- rake db:migrate 명령어로 migrate 해줌

- Controller 추가
```ruby
def boardList
  @board = Board.all
end

# View 연결
def boardWrite
		
end

# 글쓰기 처리부분(Model로 값 전달 후 db저장)
def WriteOk
	board = Board.new
	board.title = params[:title]
	board.content = params[:content]
	board.save
	redirect_to '/boardList'
end

# 해당 글의 id값을 받아옴
def boardEdit
	@board = Board.find(params[:board_id])
end

# id에 해당되는 글의 내용을 수정
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
```
- routes.rb에 Controller명시
```ruby
get '/home', to: 'home#index'
get '/boardList', to: 'home#boardList'
get '/boardWrite', to: 'home#boardWrite'
get '/WriteOk', to: 'home#WriteOk'
get '/boardEdit/:board_id', to: 'home#boardEdit'
get '/EditOk/:board_id', to: 'home#EditOk'
get '/boardDelete/:board_id', to: 'home#boardDelete'
```
- Model -> Controller -> View로 전달된 값은 View에서 아래의 형태로 받을 수 있음
```ruby
# DB값을 담고있는 변수 @board의 값을 각각(each) |board|에 담는다
<% @board.each do |board| %>
<%=board.title%>
<%=board.content%>
```
- 혹은 아래의 형식으로 바로 받을 수 있음
```ruby
<%=@board.content%>
```

### scaffolding을 사용하면 CRUD를 간단하게 사용할 수있다.
```ruby
rails g scaffold board title:string content:string
```
- 위 명령어를 입력 후 migration 해주면 Model, View, Controller 등 웹사이트 구축에 필요한 CRUD의 모든 구성요소를 알아서 만들어 줌
