require 'sinatra'
require 'faraday'
require 'fast_jsonapi'

require './poros/book'
require './serializers/book_serializer'

get '/search' do # controller method / action
  book = BookFacade.from_isbn(param[:isbn])
  BookSerializer.new(book).serialized_json
end
