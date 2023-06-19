require 'spec_helper'
require './app/models/library.rb'
require './data.rb'

RSpec.describe Library, type: :model do
    let(:library) {Library.new()}
    describe '.initialize' do
        it 'loads all of the books in the data.rb file' do
            expect(library.books.count).to eq(Class.new.extend(Data).all_books.count)
        end

        it "instantiates the data as Book class" do
            expect(library.books.first).to be_a(Book)
        end
    end

    describe '#all' do
        it 'returns all books' do
            expect(Library.new().all.count).to eq(Class.new.extend(Data).all_books.count)
        end
    end

    describe '#title' do
        context "given the same query and matcher" do
            it 'filters books based on the full title' do
                library = Library.new
                query = 'Harry Potter and the Deathly Hallows'
                library.title(query)
                expect(library.books).to include_query_text_in_attribute(query, 'title')
            end

            it 'filters books with matching strings in the title' do
                library = Library.new
                query = 'Harry Potter'
                library.title(query)                
                expect(library.books).to include_query_text_in_attribute(query, 'title')
            end
            context "when the query is incorrectly cased" do
                it 'filters books based on the full title' do
                    library = Library.new
                    query = 'HarRy Potter and tHe Deathly hAllows'
                    library.title(query)
                    expect(library.books).to include_query_text_in_attribute(query, 'title')
                end

                it 'filters books with matching strings in the title' do
                    library = Library.new
                    query = 'hArry pOtter'
                    library.title(query)                
                    expect(library.books).to include_query_text_in_attribute(query, 'title')
                end
            end
        end
        
        context "given mis-matching queries and matchers" do
            it 'filters books with matching strings in the title' do
                library = Library.new
                library.title('Harry Potter')                
                expect(library.books).not_to include_query_text_in_attribute('Hary Potter', 'title')
            end
        end

        context "no books match" do
            it 'filters books with matching strings in the title' do
                library = Library.new
                library.title('Hary Potter')                
                expect(library.books).to be_empty
            end
        end
    end

    describe '#isbn' do
        it 'filters books by the isbn' do
            library = Library.new
            first_book = library.books.first

            library.isbn(first_book.isbn)

            expect(library.books).to include(first_book)
        end
        
        it 'returns an array with 1 object' do
            library = Library.new
    
            library.isbn(library.books.first.isbn)
    
            expect(library.books.count).to eq(1)
        end
    end

    describe '#author' do
        context "given the same query and matcher" do
            it 'filters books based on the full author' do
                library = Library.new
                query = 'JK Rowling'
                library.author(query)
                expect(library.books).to include_query_text_in_attribute(query, 'author')
            end

            it 'filters books with matching strings in the author' do
                library = Library.new
                query = 'Rowling'
                library.author(query)
                expect(library.books).to include_query_text_in_attribute(query, 'author')
            end
            context "when the query is incorrectly cased" do
                it 'filters books based on the full author' do
                    library = Library.new
                    query = 'jK rOwling'
                    library.author(query)
                    expect(library.books).to include_query_text_in_attribute(query, 'author')
                end

                it 'filters books with matching strings in the author' do
                    library = Library.new
                    query = 'rOwling'
                    library.author(query)                
                    expect(library.books).to include_query_text_in_attribute(query, 'author')
                end
            end
        end
        
        context "given mis-matching queries and matchers" do
            it 'filters books with matching strings in the author' do
                library = Library.new
                library.author('Rowling')                
                expect(library.books).not_to include_query_text_in_attribute('rwoling', 'author')
            end
        end

        context "no books match" do
            it 'filters books with matching strings in the author' do
                library = Library.new
                library.author('Darwin')                
                expect(library.books).to be_empty
            end
        end
    end

    describe '#genre' do
        context "with matching query and matcher" do
            context "with matching case" do
                it 'filters books based on genre' do
                    library = Library.new
                    genre = 'Fantasy'
                    library.genre(genre)
                    expect(library.books).to be_all{|book| book.genre == genre}
                end
            end
            context "with mis-matching case" do
                it 'filters books based on genre' do
                    library = Library.new
                    genre = 'FaNtaSy'
                    library.genre(genre)
                    expect(library.books).to be_all{|book| book.genre.downcase == genre.downcase}
                end
            end
        end
    end

    # method has test coverage in author_spec
    describe '#all_authors' do
    end
    
    # method has test coverage in genre_spec
    describe '#all_genres' do
    end
end