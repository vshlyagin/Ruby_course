def search(fileName,resultFile)
    puts "Input age you want to search:"
    studentAge = gets.to_i
    i = 0
    if File.exist?(fileName)
      while (i < stringCounter(fileName) and studentAge != -1)
        file = File.open(resultFile, 'w')
        File.foreach(fileName) do |string|
          if string.include?(studentAge.to_s)
            file.puts(string)
            puts "Student found"
            i += 1
          end
        end
        puts "Input age you want to search:"
        studentAge = gets.to_i
      end
      if File.zero?(file)
        puts "No student with such age"
      end
      file.close
    else puts "File not found"
    end
  end
  
  def stringCounter(fileName)
    list = []
    File.foreach(fileName) {|string| list.push(string)}
  
    return list.length
  end
  
  def outputAll(fileName)
    if File.exist?(fileName)
      File.foreach(fileName).with_index {|string, index|
        puts "#{index}: #{string}"}
    else puts "File not found"
    end
  end
  
  
  $stateMenu
  def menu()
    puts "Choose action:\n(0) Exit the programm\n(1) Output original data\n(2) Input data\n(3) Output result data\nYour choice: "
    $stateMenu = gets.to_i
  end
  menu()
  $fileName = 'C:\Users\vshly\OneDrive\Рабочий стол\lab4\students.txt'
  $resultFile = 'C:\Users\vshly\OneDrive\Рабочий стол\lab4\results.txt'
  while $stateMenu != 0 do
    case $stateMenu
    when 1
      outputAll($fileName)
      menu()
    when 2
      search($fileName, $resultFile)
      menu()
    when 3
      outputAll($resultFile)
      menu()
    else
      puts "Invalid menu point!"
      menu()
    end
  end
  
  puts "Done!"