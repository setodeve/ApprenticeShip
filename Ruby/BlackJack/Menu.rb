# frozen_string_literal: true

class Menu
  def initialize
    puts "ブラックジャックを開始します"
  end

  def checkUser(flg)
    flg ? "あなた" : "ディーラー"
  end

  def showDrawCard(checkPlayer, num, mark)
    puts "#{checkUser(checkPlayer)}が引いたカードは#{mark}の#{num}です。"
  end

  def showPlayerPoint(point)
    puts "あなたの現在の得点は#{point}です。カードを引きますか？（Y/N）"
  end

  def showDealerDraw2ndCard
    puts "ディーラーの引いた2枚目のカードはわかりません。"
  end

  def showPoint(user)
    puts "#{checkUser(user.instance_of?(Player))}の得点は#{user.getUserPoint}です。"
  end

  def showCPUPoint(user)
    puts "プレイヤーCPUの得点は#{user.getUserPoint}です。"
  end

  def showJudgeEndGame(checkGame, player)
    if player.instance_of?(Player)
      puts checkGame ? "あなたの勝ちです" : "あなたの負けです"
    else
      puts checkGame ? "プレイヤーCPUの勝ちです" : "プレイヤーCPUの負けです"
    end
  end

  def showOverPoint
    puts "21点を超えました"
  end

  def showCheckYesorNo
    puts "Y または N を入力してください"
  end

  def continueGame
    puts "ゲームを続けますか(Y/N)"
  end

  def showEndGame
    puts "ブラックジャックを終了します。"
    # exit
  end
end
