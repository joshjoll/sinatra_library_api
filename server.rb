require 'sinatra/base'
require "sinatra/namespace"
require_relative 'models/library'



class App < Sinatra::Base
    register Sinatra::Namespace

    get '/' do
        'Welcome to my Booklist. This is a series of '
    end

    namespace '/api/v1' do
        # endpoints
        # /books - all books and filtered books
        # /book - single book by isbn
        # /genres - returns all genres
        # /genre - returns all books of that genre
        # /authors - returns all authors
        # /author - returns all books by that author
        
        before do
            content_type 'application/json'
            @library = Library.new
        end

        helpers do
            def base_url
                @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
            end

            def not_found(subject)
                halt(404, {message: "#{subject} not Found"}.to_json)
            end
        end

        get '/books' do
            [:isbn, :author, :title, :genre].each do |filter|
                @library.send(filter.to_sym, params[filter]) if params[filter]
            end
            not_found('Book') if @library.books.empty?
            return @library.books.map{|book| book.serialize(base_url)}.to_json
        end

        get '/book/:isbn' do
            @library.isbn(params['isbn'])
            book = @library.books.first
            not_found('Book') unless book
            return book.serialize(base_url).to_json
        end

        get '/authors' do
            return @library.all_authors.to_json
        end

        get '/author/:name' do
            @library.author(params[:name])
            not_found('Author') if @library.books.empty?
            return @library.books.map{|book| book.serialize(base_url)}.to_json
        end

        get '/genres' do
            return @library.all_genres.to_json
        end

        get '/genre/:genre' do
            @library.genre(params[:genre])
            not_found('Author') if @library.books.empty?
            return @library.books.map{|book| book.serialize(base_url)}.to_json
        end
    end
end