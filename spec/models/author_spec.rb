require 'spec_helper'
require './app/models/author.rb'
require './app/models/library.rb'

RSpec.describe Author, type: :model do
    let(:books) {Library.new.books}
    let(:author_list) {Author.all_authors(books).uniq}
    describe '.all_authors' do
        it 'returns an array of authors' do
            expect(Author.all_authors(books)).to be_a(Array)
            expect(Author.all_authors(books)).not_to be_a(Hash)
        end

        it 'includes all book authors' do
            expect(Author.all_authors(books).sort).to eq(author_list.sort) 
        end

        it 'does not have duplicates' do
            expect(Author.all_authors(books).length).to eq(author_list.length)
        end
    end

    describe '.serialize_all' do
        it 'returns a hash' do
            expect(Author.serialize_all(author_list)).to be_a(Hash)
        end

        it 'has one key named authors' do
            expect(Author.serialize_all(author_list).keys.count).to eq(1)
            expect(Author.serialize_all(author_list).keys).to include(:authors)
        end

        it "has an array of all authors" do
            expect(Author.serialize_all(Author.all_authors(books))[:authors].sort).to eq(author_list.sort)
        end
        
    end
end