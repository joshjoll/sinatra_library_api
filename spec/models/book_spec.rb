require 'spec_helper'
require './app/models/book.rb'

RSpec.describe Book, type: :model do
    describe '.initialize' do
        it 'requires 5 attributes' do
            expect{Book.new}.to raise_error(ArgumentError)  

            expect{Book.new(author: 'name', title: 'name')}.to raise_error(ArgumentError)  

            expect(Book.new(author: 'name', title: 'title', isbn:'11111', released: '1990', genre: 'testing')).to be_a(Book)
        end
    end
    
    describe '#serialize' do
        let (:book) {Book.new(
            author: 'name', 
            title: 'title', 
            isbn:'11111', 
            released: '1990', 
            genre: 'testing'
        )}

        it "returns a hash with book data" do
            serialized_data = book.serialize('')
            expect(serialized_data).to be_a(Hash)

            expect(serialized_data.keys.sort).to eq([:author, :title, :isbn, :released, :genre, :url].sort)

            expect(serialized_data).to include(
                :title => book.title,
                :author => book.author,
                :isbn => book.isbn,
                :released => book.released,
                :genre => book.genre
            )
        end

        it "builds a url to access the book resource" do
            expect(book.serialize('')[:url]).to include("/api/v1/book/#{book.isbn}")

            expect(book.serialize('localhost:4567')[:url]).to eq("localhost:4567/api/v1/book/#{book.isbn}")
        end
    end
end