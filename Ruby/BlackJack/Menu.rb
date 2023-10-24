# frozen_string_literal: true

class Menu
  def initialize
    puts "ブラックジャックを開始します"
  end

  def showDrawCard(checkPlayer, num, mark)
    if checkPlayer
      puts "あなた引いたカードは#{mark}の#{num}です。"
    else
      puts "ディーラーの引いたカードは#{mark}の#{num}です。"
    end
  end

  def showPlayerPoint(point)
    puts "あなたの現在の得点は#{point}です。カードを引きますか？（Y/N）"
  end

  def showDealerDraw2ndCard(num, mark)
    puts "ディーラーの引いた2枚目のカードはわかりません。"
  end

  def showPoint(checkPlayer, point)
    if checkPlayer
      puts "あなたの得点は#{point}です。"
    else
      puts "ディーラーの得点は#{point}です。"
    end
  end

  def showJudgeEndGame(checkGame)
    if checkGame
      puts "あなたの勝ちです"
    else
      puts "あなたの負けです"
    end
  end

  def showEndGame
    puts "ブラックジャックを終了します。"
  end
end
