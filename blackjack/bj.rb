#blackjack

class Blackjack
	
	#@@number_of_decks = 1
	#@@decks = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J","Q","K"].product(["heart", "spade", "diamond", "club"])* number_of_decks
	@@shoe = []
	
	#this is where all the available cards are stored
	def shoe
		@shoe = decks
	end
	
	#this is where all the used cards are stored
	def bin
	
	end

	#this is where all the played cards are stored
	def table
		
	end

	#
	def shuffling (all_cards)
		all_cards.shuffle
	end

	#all the cards
	def deck(number_of_decks)
		@@shoe = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J","Q","K"].product(["heart", "spade", "diamond", "club"])* number_of_decks
	end

	#names of the players
	def player_name
		@player_name = player_name
	end

end

