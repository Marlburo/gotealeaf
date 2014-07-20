#blackjack
  
#4 deck, 6 decks and 8 decks
system 'clear'

def deck_size(number_of_decks)
  all_cards = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J","Q","K"].product(["heart", "spade", "diamond", "club"])* number_of_decks
  return  all_cards
end

  #this is where all the used cards are stored
def bin
  
end
  
def shuffling (all_cards)
  shuffled = all_cards.shuffle
  return  shuffled
end 

def welcome_msg
  system 'clear'
  puts 'Welcome to black jack, Please enter your name'
  $player_name = gets.chomp
  #puts 'hello ' + $player_name +' hope you have fun losing your money >:)'
  #sleep (2)
  system 'clear'
  $player_money = 500 #player starting money
  #puts  'you start the game with 500 tokens... how much would you like to bet'
  #$player_bet = gets.chomp
  puts 'shuffling'
  sleep (2)
  system 'clear'
end

def check_cards(card_review)
  if (card_review == 'J' || card_review == 'Q' || card_review == 'K')
    return 10
  elsif card_review == 'A'
    if $pcv == 1 && $player_card_value > 10 
      return 1
    elsif $dcv == 1 && $dealer_card_value > 10
      return 1
    else
      return 11
    end
  else 
    return card_review.to_i
  end
end


def deal_card_p(number_of_cards)
  sleep(1)  
  $player_cards = $shoe.pop(number_of_cards)
  $pcv = 1
  a = check_cards($player_cards[-1][0])#, pcv)#, $player_card_value)
  $player_card_value = $player_card_value + a #$player_cards[-1][0].to_i

  sleep(2)
  $pcv = 0
end

def deal_card_d(number_of_cards)
  sleep(1)
  $dealer_cards = $shoe.pop(number_of_cards)
  $dcv = 1
  b = check_cards ($dealer_cards[-1][0])#, dcv)  #.last)#, $dealer_card_value)
  $dealer_card_value = $dealer_card_value + b #$dealer_cards[-1][0].to_i

  sleep(2)
  $dcv = 0
end

def check_winner(info)
  if info == '1'
    deal_some_more(1)
    puts "player card = #{$player_cards}"
    check_dealer_won(1)
  elsif info == '2'
    check_dealer_won(1)
    #show_me_d_money
  else
    #do nothing
    check_dealer_won(1)
  end
end

def quit_game
  $play = 0
end

def deal_some_more(number)
  deal_card_p(number)
end

def compare_results
  if $player_card_value >= 20
    $exit = 1
  else
    $exit = 2
  end
end

def check_dealer_won(number)
  if $dealer_card_value < 16 && $player_card_value > $dealer_card_value
    deal_card_d(number)
    while $dealer_card_value < 16 && $player_card_value > $dealer_card_value
      deal_card_d(1)
    end
  else
    if ($player_card_value <= 21 && $player_card_value > $dealer_card_value) || ($dealer_card_value > 21 && $player_card_value <= 21)
      if $mk_sure == 1
        puts $player_name + " wins"
      else
      end

    elsif $player_card_value == $dealer_card_value
      if $mk_sure == 1
        puts "Its a draw"
      else
      end    
    else
      if $mk_sure == 1
        puts 'the house wins'
      else
      end
    end
  end
end

number_of_decks = 4 #we will use only four decks
$play = 1
$pcv = 0 #player card value controller
$dcv = 0 #dealer card value controller
$player_cards = 0
$dealer_cards = 0
$player_card_value = 0
$dealer_card_value = 0
$house_status = 0
$dealer_won = 0
$mk_sure = 0
$exit = 1

all_cards = deck_size(number_of_decks)#all cards available in the game
ext_var = all_cards.size
#
shuffled_cards = shuffling(all_cards)
$shoe = shuffled_cards
while $play == 1
  
  welcome_msg()
  sleep(2)
#----------------------------------------
  puts 'Dealing cards....'

  deal_card_p(1)
  puts "player card = #{$player_cards}"
    
  deal_card_d(1)
  puts '                                        dealer card =    facing down'

  deal_card_p(1)
  puts "player card = #{$player_cards}"
    
  deal_card_d(1)
  puts "                                        dealer card = #{$dealer_cards}"
  
  sleep(2)

  puts 'And the total is...'
  #puts $player_cards
  puts "player's total = #{$player_card_value}"
  #puts $dealer_cards
  puts "                                        dealer's total =  ***** "#{$dealer_card_value}"

  puts "hit me = 1, stay = 2"
  $hitme = gets.chomp
  while $hitme == '1'

    check_winner($hitme)
    puts 'And the total is...'
    puts "player's total = #{$player_card_value}"
    puts "                                        dealer's total = #{$dealer_card_value}"
    compare_results()
    if $exit == 2
      puts 'hit me = 1, stay = 2'
      $hitme = gets.chomp
    else 
      $hitme = '2'
    end
  end
  $mk_sure = 1
  check_dealer_won(2)
  sleep(3)
  puts "player's total = #{$player_card_value}"
  puts "                                        dealer's total = #{$dealer_card_value}"
  sleep(6)
  #check_dealer_won(2)
  #sleep(6)
  #puts "player's total = #{$player_card_value}"
  #puts "                                        dealer's total = #{$dealer_card_value}"  
 
  $mk_sure = 0  
  $player_card_value = 0
  $dealer_card_value = 0
end
