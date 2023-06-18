class Author

    def self.all_authors(books)
        return books.map{|book| book.author}.uniq
    end

    def self.serialize_all(authors)
        return {
            :authors => authors
        }
    end
    
end