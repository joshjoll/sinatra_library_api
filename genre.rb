class Genre

    def self.all_genres(books)
        return books.map{|book| book.genre}.uniq
    end

    def self.serialize_all(genres)
        return {
            :genres => genres
        }
    end
end