require 'sinatra'
require "sinatra/namespace"
require_relative 'library'



get '/' do
    'Welcome to Booklist, again'
end

namespace '/api/v1' do

    before do
        puts params
        content_type 'application/json'
        @library = Library.new

    end

    helpers do
        def base_url
            @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
        end

        def no_books_found
            halt(404, {message: 'Book not Found'}.to_json)
        end
    end

    get '/books' do
        [:isbn, :author, :title, :genre].each do |filter|
            @library.send(filter.to_sym, params[filter]) if params[filter]
        end
        no_books_found if @library.books.empty?
        return @library.books.map{|book| book.serialize(base_url)}.to_json
    end

    get '/book/:isbn' do
        @library.isbn(params['isbn'])
        book = @library.books.first
        no_books_found unless book
        return book.serialize(base_url).to_json
    end
end