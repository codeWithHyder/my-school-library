require_relative('../book')

module AddBook
  def add_book
    puts 'What is the title of the book?'
    title = gets.chomp
    puts 'Who is the author of the book?'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book successfully created'
  end
end
