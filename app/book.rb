class Book
    attr_reader :author, :title, :isbn, :released, :genre

    def initialize(author:, title:, isbn:, released:, genre:)
      @author = author
      @title = title
      @isbn = isbn
      @released = released
      @genre = genre
    end

    def serialize(base_url)
        data = {
            author: @author.to_s,
            title: @title.to_s,
            released: @released.to_s,
            isbn: @isbn.to_s,
            genre: @genre,
            url: "#{base_url}/api/v1/book/#{@isbn}"
        }
        data
    end
    
end