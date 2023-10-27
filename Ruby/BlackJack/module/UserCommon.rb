module UserCommon

  def getUserCard
    @cardonhand
  end

  def getUserPoint
    @point
  end

  def getOverFlg
    @overflg
  end

  def getmoney
    @money
  end

  def getbet
    @bet
  end

  def setplusmoney(money)
    @money+=money
  end

  def setminusmoney(money)
    @money-=money
  end

  def setbet(bet)
    @bet+=bet
  end

  def setOverFlg(flg)
    @overflg = flg
  end

  def getSurrenderFlg
    @surrenderflg
  end

  def setSurrenderFlg(flg)
    @surrenderflg = flg
  end

  def setUserPoint(point)
    @point += point
  end

  def clearUserPoint
    @point = 0
  end

  def clearUserInfo
    @cardonhand = Array.new(0)
    @point = 0
    @overflg = false
    @surrenderflg = false
  end

end