require_relative 'data'
require_relative 'book'
# require_relative 'author'
require_relative 'genre'

class Library
    include Data
    attr_reader :books
    
    def initialize()
        @books = all_novels.map do |book| 
            Book.new(
                author: book[:author], 
                isbn: book[:isbn], 
                title: book[:title], 
                released: book[:released], 
                genre: book[:genre]
            )
        end
    end

    def all
        @books
    end

    def title(title)
        @books = @books.select{ |book| book.title.downcase.match(/#{title.downcase}/) }
        return nil
    end

    def isbn(isbn)
        @books = @books.select{ |book| book.isbn.to_i == isbn.to_i }
        return nil
    end

    def author(author)
        @books = @books.select{ |book| book.author.downcase.match(/#{author.downcase}/)}
        return nil
    end

    def genre(genre)
        @books = @books.select{ |book| book.genre.downcase == genre.downcase}
    end

    def all_genres
        Genre.serialize_all(Genre.all_genres(@books))
    end

end