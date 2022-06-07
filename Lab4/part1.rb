def index()
  if File.exist?(FILE_PATH)
    File.foreach(FILE_PATH).with_index {|string, index|
      puts "#{index}: #{string}"}
  else puts "File not found"
  end
end

def find(id)
  if File.exist?(FILE_PATH)
    File.foreach(FILE_PATH).with_index do |string, index|
      if index.eql? id
        puts "Your string is #{string}"
      end
    end
  else puts "File not found"
  end
end

def where(pattern)
  if File.exist?(FILE_PATH)
    File.foreach(FILE_PATH).with_index do |string,index|
      if string.include?(pattern)
        puts "Content line <<#{pattern}>> with index: #{index}"
      end
    end
  else puts "File not found"
  end
end

def update(id, text)
  if File.exist?(FILE_PATH)
    file = File.open(BUFFER_PATH, 'w')

    File.foreach(FILE_PATH).with_index do |string, index|
      file.puts(id == index ? text : string)
    end

    file.close
    File.write(FILE_PATH, File.read(BUFFER_PATH))
    File.delete(BUFFER_PATH) if File.exist?(BUFFER_PATH)
  else puts "File not found"
  end
end


def delete(id)
  if File.exist?(FILE_PATH)
    list = []
    File.foreach(FILE_PATH).with_index do |string, index|
      if index != id
        list.push(string)
      end
    end
    File.write(FILE_PATH, list.join())
  else puts "File not found"
  end
end



FILE_PATH = 'C:\Users\vshly\OneDrive\Рабочий стол\lab4\part1.txt'
BUFFER_PATH = 'C:\Users\vshly\OneDrive\Рабочий стол\lab4\buffer.txt'


index()
find(3)
where("l")
update(1, "Peace")
delete(2)
puts
puts "File after change: "
index()