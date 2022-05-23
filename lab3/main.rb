
def closeOnCS(word)
	if (word[-2..-1] == "CS")
		puts 2**word.size
	else 
		puts word.reverse
	end
end

print "Enter a word : "

words = gets.to_s.chomp

closeOnCS words

def spisokPokemonov()
    print "Enter number of Pokemons: "
    n = gets.to_i
    puts
    pokemons = Hash.new{n}
    i = 0
    while i < n
        i += 1
        print "Enter a pokemon name: " 
        pockemon_name = gets.to_s.chomp
        print "Enter its color: "
        pockemon_color = gets.to_s.chomp
        puts
        pokemons[pockemon_name] = pockemon_color
    end
    
    puts "Pokemon list you created: "
    pokemons.each { |x, y| puts "Name:#{x}: Color:#{y}, " }
end
spisokPokemonov

