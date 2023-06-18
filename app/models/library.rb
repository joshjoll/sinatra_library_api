require_relative '../../data'
require_relative 'book'
require_relative 'genre'
require_relative 'author'

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
    # filters for /books
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

    # summary resources for other endpoints
    def all_authors
        Author.serialize_all(Author.all_authors(@books))
    end

    def all_genres
        Genre.serialize_all(Genre.all_genres(@books))
    end

end