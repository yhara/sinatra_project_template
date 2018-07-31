class MyApp < Sinatra::Base
  get '/books' do
    session["ct"] ||= 0; session["ct"] += 1
    @books = Book.order(updated_at: :desc)
    slim :'books/index'
  end

  get '/books/new' do
    @book = Book.new
    slim :'books/new'
  end

  get '/books/:id' do
    @book = Book.find_by!(id: params[:id])
    slim :'books/show'
  end

  post '/books' do
    @book = Book.new(title: params[:title])
    if @book.save
      @flash[:notice] = "Created record: #{@book.title}"
      redirect "/books/#{@book.id}"
    else
      @flash[:alert] = "Failed to save record: #{@book.errors.messages.inspect}"
      slim :'books/new'
    end
  end

  get '/books/:id/edit' do
    @book = Book.find_by!(id: params[:id])
    slim :'books/edit'
  end

  put '/books/:id' do
    @book = Book.find_by!(id: params[:id])
    @book.title = params[:title]
    if @book.save
      @flash[:notice] = "Updated record: #{@book.title}"
      redirect "/books/#{@book.id}"
    else
      slim :'books/edit'
    end
  end

  delete '/books/:id' do
    book = Book.find_by!(id: params[:id])
    book.destroy
    @flash[:notice] = "Deleted record: #{book.title}"
    redirect "/books"
  end
end
