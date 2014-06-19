#blackjack
# Im going to use binding.pry, slice, shuffle, sample, unshift
	
#4 deck, 6 decks and 8 decks
system 'clear'

def deck_size(number_of_decks)
	all_cards = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J","Q","K"].product(["heart", "spade", "diamond", "club"])* number_of_decks
	return	all_cards
end

	#this is where all the used cards are stored
def bin
	
end

	#this is where all the played cards are stored
def player_cards
		
end

def dealers_cards
	
end
	
def shuffling (all_cards)
	shuffled = all_cards.shuffle
	return	shuffled
end	

def welcome_msg
	puts 'Welcome to the best black jack game available, Please enter your name'
	player_name = gets.chomp

	puts 'hello ' + player_name +'your dealer tonight will be Mr. Soprano'
	sleep (2)
	system 'clear'
	
	puts	'place a bet'
	player_bet = gets.chomp
	puts 'shuffling'
end

def check_cards(card_review, card_value)
	if card_review == ('J'|| 'Q' || 'K')
		return 10
	elsif card_review == 'A'
		return
			
	
end

def deal_card_p(number_of_cards)
	puts 'dealing'

	sleep(1)	
	$player_cards = $player_cards + $shoe.pop(number_of_cards)
	a = check_cards($player_cards(-1), $player_card_value)
	$player_card_value = $player_card_value + $player_cards[-1][0].to_i
end

def deal_card_d(number_of_cards)
	puts 'dealing'
	sleep(1)
	$dealer_cards = $dealer_cards + $shoe.pop(number_of_cards)
	a = check_cards($dealer_cards(-1), $dealer_card_value)
	$dealer_card_value = $dealer_card_value + $dealer_cards[-1][0].to_i
end
#A = 1 or 11, (J & Q & K) = 10



number_of_decks = 4 #we will use only four decks

$player_cards = [' ']
$dealer_cards = [' ']
$player_card_value = 0
$dealer_card_value = 0

all_cards = deck_size(number_of_decks)#all cards available in the game
ext_var = all_cards.size
#
#the loop should begin here
#
shuffled_cards = shuffling(all_cards)

while true
	welcome_msg()
	sleep(2)
	system 'clear'

	$shoe = shuffled_cards
#we start dealing the cards
#----------------------------------------
	puts 'Dealing cards....'

	deal_card_p(1)
	deal_card_d(1)
	deal_card_p(1)
	deal_card_d(1)
	sleep(2)
	system 'clear'

	puts 'player card'
	puts $player_cards
	puts "#{$player_card_value}"
	puts 'dealer card'
	puts $dealer_cards
	puts "#{$dealer_card_value}"

	check_cards
	#----------------------------------------
end
#puts player_cards
#puts dealer_cards
