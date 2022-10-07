require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class App
  def initialize
    @all_books = []
    @all_people = []
    @rentals = []
  end

  def list_books
    puts 'No book added yet' if @all_books.empty?
    @all_books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    puts 'No person added yet' if @all_people.empty?
    @all_people.each do |person|
      person.rentals
      unless person.is_a? Teacher
        puts "[Student] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
      unless person.is_a? Student
        puts "[Teacher] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    n = gets.chomp.to_i
    create_student unless n == 2
    create_teacher unless n == 1
  end

  def create_book
    print 'Title: '
    title = gets.chomp.to_s
    print 'Author: '
    author = gets.chomp.to_s
    book = Book.new(title, author)
    @all_books << book
    puts 'Book created successfully'
  end

  def rent_book
    puts 'Select a book from the following list by number'
    @all_books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    selected_book = gets.chomp.to_i
    book = @all_books[selected_book]
    puts 'Select a person from the following list by number (not id)'
    @all_people.each_with_index do |person, index|
      unless person.is_a? Teacher
        puts "#{index}) [Student] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
      unless person.is_a? Student
        puts "#{index}) [Teacher] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    end
     selected_person = gets.chomp.to_i
      person = @all_people[selected_person]
      date = Time.now.strftime('%Y/%m/%d')
      puts "Date: #{date}"
      rental = Rental.new(date, book, person)
      @rentals << rental
    puts "Book rented successfully"
  end

  def list_rentals
    puts 'No rentals yet' if @rentals.empty?
    @rentals.each do |rental|
      puts "ID of person: #{rental.person.id}"
      puts 'Rentals: '
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def exit_app
    puts 'Thank you for using this app'
    exit!
  end

  private

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.to_s.upcase

    case permission
    when 'N'
      permission = false
    when 'Y'
      permission = true
    else
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.to_s.upcase
    end
    student = Student.new(age, name, permission)
    @all_people << student
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'specialization: '
    specialization = gets.chomp.to_s
    teacher = Teacher.new(age, name, specialization)
    @all_people << teacher
    puts 'Person created successfully'
  end
end
