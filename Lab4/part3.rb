def deposit()
    puts "Insert the sum you want to deposit:"
    depositSum = gets.to_i
    if depositSum > 0
      $balance = $balance + depositSum
    else puts "Incorrect sum!"
    end
    puts "Your balance now is: #{$balance}"
  end
  
  def withdraw()
    puts "Insert the sum you want to withdraw:"
    withdrawSum = gets.to_i
    if (withdrawSum > 0 and withdrawSum <= $balance)
      $balance = $balance - withdrawSum
    else puts "Incorrect sum!"
    end
    puts "Your balance now is: #{$balance}"
  end
  
  
  def balance()
    puts "Your balance now is: #{$balance}"
  end
  
  
  
  BANK_ACCOUNT = 'C:\Users\vshly\OneDrive\Рабочий стол\lab4\balance.txt'
  $stateMenu
  def bankAccount(fileName)
    if File.exist?(fileName)
      File.foreach(fileName) {|string| $balance = string.to_i}
    else puts "File not found"
    end
    puts "Your balance: #{$balance}"
  end
  
  def menu()
    puts "Choose action:\n(Q) Exit the programm\n(D) Deposit\n(W) Withdraw\n(B) balance\nYour choice: "
    $stateMenu = gets.chomp
  end
  
  
  
  bankAccount(BANK_ACCOUNT)
  menu()
  while ($stateMenu != "Q" and $stateMenu != "q") do
    case $stateMenu
    when "D", "d"
      deposit()
      menu()
    when "W", "w"
      withdraw()
      menu()
    when "B", "b"
      balance()
      menu()
    else
      puts "Invalid menu point!"
      puts "Enter the answers provided!"
      menu()
    end
  end
  
  puts "Done!"