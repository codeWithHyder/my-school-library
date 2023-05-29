module ListAllRentals
  def list_rentals
    puts 'Id of the person: '
    person_id = gets.chomp.to_i
    person = @persons.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person do not exist'

      return
    end
    puts "Rentals of #{person.name}:"
    person.rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
