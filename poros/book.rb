class Book
  attr_reader :id, :title, :author, :description, :thumbnail, :isbn, :category

  def initialize(attributes)
    @id = nil
    @title = attributes[:title]
    @author = attributes[:author]
    @description = attributes[:description]
    @thumbnail = attributes[:thumbnail]
    @isbn = attributes[:isbn]
    @category = attributes[:category]
  end
end
