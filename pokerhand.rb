module PokerHand

	def self.best_hand(cards)
		@cards = cards

		case true
		when royal_flush?
			'Royal Flush'
		when straight? && flush?
			'Straight Flush'
		when of_kind?(4)
			'Four of a kind'
		when of_kind?(3) && of_kind?(2)
			'Full House'
		when flush?
			'Flush'
		when straight?
			'Straight'
		when of_kind?(3)
			'Three of a kind'
		when two_pair?
			'Two Pair'
		when of_kind?(2)
			'One Pair'
		else
			'High Card'
		end
	end

	def self.card_arr
		@cards.split
	end

	def self.grouped_cards
		card_arr.group_by { |c| c.chop }
	end

	def self.of_kind?(number)
		grouped_cards.any? { |c, v| v.length == number }
	end

	def self.flush?
		card_arr.group_by { |c| c[-1] }.length == 1
	end

	def self.straight?
		if ranks == ranks.uniq
			ranks.min.to_i + 4 == ranks.max.to_i
		end
	end

	def self.royal_flush?
		ranks.max == 14 && straight? && flush?
	end

	def self.two_pair?
		grouped_cards.length == 3
	end

	def self.ranks
		rank_to_number = { 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }
		card_arr.map { |card| rank_to_number[card.chop] || card.chop.to_i }
	end
end
