require 'spec_helper'
require './app/models/genre.rb'
require './app/models/library.rb'

RSpec.describe Genre, type: :model do
    let(:books) {Library.new.books}
    let(:genre_list) {Genre.all_genres(books).uniq}
    describe '.all_genres' do
        it 'returns an array of genres' do
            expect(Genre.all_genres(books)).to be_a(Array)
            expect(Genre.all_genres(books)).not_to be_a(Hash)
        end

        it 'includes all book genres' do
            expect(Genre.all_genres(books).sort).to eq(genre_list.sort) 
        end

        it 'does not have duplicates' do
            expect(Genre.all_genres(books).length).to eq(genre_list.length)
        end
    end

    describe '.serialize_all' do
        it 'returns a hash' do
            expect(Genre.serialize_all(genre_list)).to be_a(Hash)
        end

        it 'has one key named genres' do
            expect(Genre.serialize_all(genre_list).keys.count).to eq(1)
            expect(Genre.serialize_all(genre_list).keys).to include(:genres)
        end

        it "has an array of all genres" do
            expect(Genre.serialize_all(Genre.all_genres(books))[:genres].sort).to eq(genre_list.sort)
        end
        
    end
end