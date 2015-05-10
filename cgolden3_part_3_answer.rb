class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    if player1.length!=2 || !/^[RPS]$/i.match(player1[1]) ||
        player2.length!=2 || !/^[RPS]$/i.match(player2[1])
      raise NoSuchStrategyError, 'Strategy must be one of R,P,S'
    end
    p1 = player1[1].upcase
    p2 = player2[1].upcase
    if (p1 == 'R' && p2 == 'P') ||
       (p1 == 'P' && p2 == 'S') ||
       (p1 == 'S' && p2 == 'R')
      return player2
    end
    player1
  end

  def self.tournament_winner(tournament)
    if tournament.length != 2
      raise NoSuchStrategyError
    end
    if tournament[0][0].kind_of?(Array) &&
        tournament[1][0].kind_of?(Array)
      return self.winner(self.tournament_winner(tournament[0]),
                         self.tournament_winner(tournament[1]))
    else
      self.winner(tournament[0], tournament[1])
    end
  end

end