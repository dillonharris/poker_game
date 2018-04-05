require_relative 'pokerhand'

describe PokerHand do
  describe 'check that the best hand' do
    it 'is a High card' do
      ['AS JD 3C 5H 2D', '2S 5S JC 9D 8H'].each do |hand|
        expect(PokerHand.best_hand(hand)).to eq('High Card')
      end
    end

  	it 'is a One Pair' do
      ['AS AD 3C 6H 9S', 'JC 7D JC 3H 9S', '9C KD JC QH 9S'].each do |hand|
  		  expect(PokerHand.best_hand(hand)).to eq('One Pair')
      end
  	end

  	it 'is a Two Pair' do
      ['KD KH JS JC 4H', '9D 4H 9S KC 4C'].each do |hand|
  		  expect(PokerHand.best_hand(hand)).to eq('Two Pair')
  	  end
    end

  	it 'is a Three of a kind' do
      ['2H 2S 2D 5C 9H', '9C 2S 9D 5C 9H', '10H 10C 10D KS AH'].each do |hand|
  		  expect(PokerHand.best_hand(hand)).to eq('Three of a kind')
  		end
    end

  	it 'is a Straight' do
      ['8H 7C 6D 5S 4H', '10H JC QD KS AH'].each do |hand|
  		  expect(PokerHand.best_hand(hand)).to eq('Straight')
  		end
  	end

  	it 'is a Flush' do
      ['KH 8H 6H 4H 2H', 'KS 8S 6S 4S 2S'].each do |hand|
  		  expect(PokerHand.best_hand(hand)).to eq('Flush')
  		end
  	end

  	it 'is a Full House' do
      ['AH AS AD KS KH', '9H 9S 5D 5S 5H'].each do |hand|
  		  expect(PokerHand.best_hand(hand)).to eq('Full House')
      end
  	end

  	it 'is a Four of a kind' do
      ['QC QH QS QD 5C', 'QC 5H 5S 5D 5C'].each do |hand|
  		  expect(PokerHand.best_hand(hand)).to eq('Four of a kind')
  		end
  	end

  	it 'is a Straight Flush' do
      ['10C 9C 8C 7C 6C', '3D 4D 5D 6D 7D'].each do |hand|
  		  expect(PokerHand.best_hand(hand)).to eq('Straight Flush')
  	  end
    end

    it 'is a Royal Flush' do
      ['AH KH QH JH 10H', 'AS KS QS JS 10S'].each do |hand|
  		  expect(PokerHand.best_hand(hand)).to eq('Royal Flush')
      end
  	end
  end
end
