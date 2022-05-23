puts

def greeting(name, secondName, old)
		if (old < 18)
				puts "Привет, #{name} #{secondName}. Тебе меньше 18-ти лет, но начать учиться программировать никогда не рано"
		else 
			puts "Привет, #{name} #{secondName}. Самое время занятся делом"
		end
end

greeting "Valentine", "Shlyagin", 17



def foobar(number1, number2)
		if (number1 == 20 || number2 == 20)
			return number2
		else 
			puts (number2 + number1)
		end
end

puts foobar 23, 22