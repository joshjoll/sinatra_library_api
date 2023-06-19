# This file holds all of the data used in this API. 
# This API does not use a database, and pulls from this module only
module Data
    #book format
    # {:author => '', :title => '', :released => '', :isbn => '', :genre => ''},

    def all_books
        return fantasy_novels + technical_books + non_fiction_books + fiction_books + other_books
    end

    def fantasy_novels
        [
            {:author => 'JK Rowling', :title => 'Harry Potter and the Sorcerers stone', :released => '1997', :isbn => '0012345', :genre => 'Fantasy'},
            {:author => 'JK Rowling', :title => 'Harry Potter and the Chamber of Secrets', :released => '1999', :isbn => '00123456', :genre => 'Fantasy'},
            {:author => 'JK Rowling', :title => 'Harry Potter and the Prizoner of Azkaban', :released => '2000', :isbn => '00123457', :genre => 'Fantasy'},
            {:author => 'JK Rowling', :title => 'Harry Potter and the Goblet of Fire', :released => '2001', :isbn => '00123458', :genre => 'Fantasy'},
            {:author => 'JK Rowling', :title => 'Harry Potter and the Order of the Phoenix', :released => '2003', :isbn => '00123459', :genre => 'Fantasy'},
            {:author => 'JK Rowling', :title => 'Harry Potter and the Half Blood Prince', :released => '2005', :isbn => '0012346', :genre => 'Fantasy'},
            {:author => 'JK Rowling', :title => 'Harry Potter and the Deathly Hallows', :released => '2007', :isbn => '00123461', :genre => 'Fantasy'},
            {:author => 'JR Tolkien', :title => 'Lord of the Rings: The Fellowship', :released => '1954', :isbn => '04233461', :genre => 'Fantasy'},
            {:author => 'JR Tolkien', :title => 'Lord of the Rings: The Two Towers', :released => '1958', :isbn => '04243461', :genre => 'Fantasy'},
            {:author => 'JR Tolkien', :title => 'Lord of the Rings: Return of the King', :released => '1965', :isbn => '04523461', :genre => 'Fantasy'},
            {:author => 'CS Lewis', :title => 'The Magicians Nephew', :released => '1955', :isbn => '045235134', :genre => 'Fantasy'},
            {:author => 'CS Lewis', :title => 'The Lion, The Witch, and The Wardrobe', :released => '1950', :isbn => '06815134', :genre => 'Fantasy'},
            {:author => 'CS Lewis', :title => 'The Horse and His Boy', :released => '1954', :isbn => '763455134', :genre => 'Fantasy'},
            {:author => 'CS Lewis', :title => 'Prince Caspian', :released => '1951', :isbn => '091345134', :genre => 'Fantasy'},
            {:author => 'CS Lewis', :title => 'The Voyage of the Dawn Treader', :released => '1952', :isbn => '07615134', :genre => 'Fantasy'},
            {:author => 'CS Lewis', :title => 'The Silver Chair', :released => '1953', :isbn => '673125134', :genre => 'Fantasy'},
            {:author => 'CS Lewis', :title => 'The Last Battle', :released => '1956', :isbn => '16245134', :genre => 'Fantasy'},
            {:author => 'Frank Herbert', :title => 'Dune', :released => '1965', :isbn => '7723384825', :genre => 'Fantasy'}
        ]
    end

    def technical_books
        [
            {:author => 'Gayle Laakmann Mcdowell', :title => 'Cracking the Coding Interview', :released => '', :isbn => '0911781196', :genre => 'Technical'},
            {:author => 'Aditya Bhargava', :title => 'Grokking Algorithms', :released => '2015', :isbn => '3826027550', :genre => 'Technical'},
            {:author => 'Steven Holzner', :title => 'Design Patterns for Dummies', :released => '2006', :isbn => '7986354231', :genre => 'Technical'},
            {:author => 'Robert Cecil Martin', :title => 'Clean Code', :released => '2008', :isbn => '0137409041', :genre => 'Technical'},
            {:author => 'Luciano Ramalho', :title => 'Fluent Python', :released => '2015', :isbn => '1454357653', :genre => 'Technical'},
            {:author => 'Alexandre Fayolle, Holger Brunn, and Parth Gajjar', :title => 'Odoo 12 Development Cookbook', :released => '2019', :isbn => '8926736439', :genre => 'Technical'},
            {:author => 'Dave Thomas, Andy Hunt', :title => 'The Pragmatic Programmer', :released => '1999', :isbn => '4945006022', :genre => 'Technical'},
            {:author => 'Sandi Metz', :title => 'Practical Object-Oriented Design in Ruby', :released => '2012', :isbn => '4311878426', :genre => 'Technical'},
            {:author => 'David A. Black', :title => 'The Well Grounded Rubyist', :released => '2009', :isbn => '0952490129', :genre => 'Technical'},

        ]
    end

    def non_fiction_books
        [
            {:author => 'Steven Johnson', :title => 'How We Got to Now', :released => '2014', :isbn => '2814969587', :genre => 'Non-fiction'},
            {:author => 'Malcolm Gladwell', :title => 'The Tipping Point', :released => '2000', :isbn => '6338334740', :genre => 'Non-fiction'},
            {:author => 'Alexandra Horowitz', :title => 'On Looking', :released => '2013', :isbn => '4726203481', :genre => 'Non-fiction'},
            {:author => 'Nick Hornby', :title => 'Fever Pitch', :released => '1992', :isbn => '8935311380', :genre => 'Non-fiction'},
        ]
    end

    def fiction_books
        [
            {:author => 'Jeff Shaara', :title => 'To the Last Man', :released => '2004', :isbn => '2295569057', :genre => 'Fiction'},
            {:author => 'Jeff Shaara', :title => 'The Frozen Hours', :released => '2017', :isbn => '0894074666', :genre => 'Fiction'},
            {:author => 'Michael Shaara', :title => 'Killer Angels', :released => '1974', :isbn => '6369453538', :genre => 'Fiction'},
            {:author => 'David Guterson', :title => 'Snow Falling on Cedars', :released => '1994', :isbn => '7179495852', :genre => 'Fiction'},
            {:author => 'Dan Brown', :title => 'Origin', :released => '2017', :isbn => '6808003746', :genre => 'Fiction'},
        ]
    end

    def other_books
        [

        ]
    end


end
