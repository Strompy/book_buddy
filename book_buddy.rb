require 'sinatra'
require 'faraday'
require 'fast_jsonapi'

get '/search' do
  url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{params[:isbn]}"
  response = Faraday.get(url)
  results = JSON.parse(response.body, symbolize_names: true)

  book_params = {
    title: results[:items][0][:volumeInfo][:title],
    author: results[:items][0][:volumeInfo][:authors][0],
    description: results[:items][0][:volumeInfo][:description],
    thumbnail: results[:items][0][:volumeInfo][:imageLinks][:thumbnail],
    isbn: results[:items][0][:volumeInfo][:industryIdentifiers].find do |e|
      e[:type] == "ISBN_13"
    end[:identifier],
    category: results[:items][0][:volumeInfo][:categories].first
  }
  
  BookSerializer.new(Book.new(book_params)).serialized_json
end
