module ListAllPeople
  def list_people
    if @persons.empty?
      puts 'No person available'
    else
      @persons.each do |person|
        puts "[#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

    end
  end
end
