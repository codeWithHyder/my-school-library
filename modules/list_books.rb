module ListAllBooks
  def list_books
    if @books.empty?
      puts 'No books available'
    else

      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end

    end
  end
end
