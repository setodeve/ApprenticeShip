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

  def showDealerDraw2ndCard
    puts "ディーラーの引いた2枚目のカードはわかりません。"
  end

  def showPoint(user)
    if user.instance_of?(Player)
      puts "あなたの得点は#{user.getUserPoint}です。"
    else
      puts "ディーラーの得点は#{user.getUserPoint}です。"
    end
  end

  def showJudgeEndGame(checkGame)
    puts checkGame ? "あなたの勝ちです" : "あなたの負けです"
    showEndGame()
    exit
  end

  def showCheckYesorNo
    puts "Y または N を入力してください"
  end

  def showEndGame
    puts "ブラックジャックを終了します。"
  end
end
