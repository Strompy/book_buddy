class BookSerializer
  include FastJsonapi::ObjectSerializer

  attribute :title, :author, :description, :thumbnail, :isbn, :category
end
