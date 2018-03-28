class Room
  def compute_rental(public_rate, private_rate)
    ##
    # 公共面积
    # =========
    #{
    #  balcony:     '阳台',
    #  toilet:      '卫生间',
    #  kitchen:     '厨房',
    #  living_room: '客厅',
    #  hallway:     '玄关'
    #}
    balcony     = 180
    toilet      = 288+324
    kitchen     = 756
    living_room = 2548-785
    hallway     = 526

    _public = [balcony, toilet, kitchen, living_room, hallway]

    ##
    # 私有面积
    # ==========
    # r1: 曦曦
    # r2: 阿黄
    # r3: 啊徐
    # r4: 小姐姐
    r1 = 1120+160
    r2 = 785
    r3 = 785
    r4 = 982

    _private = [r1, r2, r3, r4]

    # 总面积
    total         = (_public+_private).inject(0) {|sum, e| sum += e}
    public_total  = _public.inject(0) {|sum, e| sum += e}
    private_total = _private.inject(0) {|sum, e| sum += e}

    # 平均共用面积
    public_avg  = public_total / 4.to_f
    _public_avg =  public_total/ 5.to_f

    # 每平方平均价格
    avg_price = 6600/total.to_f

    # 加权的公共面积平均价格

    weight_price_hash = weight_price(6600, {_public: public_total, _private:  private_total}, {_public: public_rate, _private: private_rate})
    public_avg_price  = weight_price_hash[:public_avg]
    private_avg_price = weight_price_hash[:private_avg]

    # 不加菊菊的公共面积
    xixi  = (r1 + public_avg) * avg_price
    huang = (r2 + public_avg) * avg_price
    axu   = (r3 + public_avg) * avg_price
    ying  = (r4 + public_avg) * avg_price

    # 加菊菊的公共面积
    _xixi  = r1 * private_avg_price + _public_avg * public_avg_price
    _huang = r2 * private_avg_price + _public_avg * 2 * public_avg_price
    _axu   = r3 * private_avg_price + _public_avg * public_avg_price
    _ying  = r4 * private_avg_price + _public_avg * public_avg_price

    puts "不加菊菊的费用：计算公式：（4个房间的人均公共面积+ 私人面积）/总面积 * 每平方的钱） 曦曦：#{xixi}, 阿黄：#{huang}, 啊徐：#{axu}, 小姐姐：#{ying}"
    puts "加上菊菊的费用:  计算公式：（5个人的人均公共面积 * 加权公共面积每平方的钱 + 私人面积 * 加权的私人面积每平方的钱）  曦曦：#{_xixi}, 阿黄：#{_huang}, 啊徐：#{_axu}, 小姐姐：#{_ying}"
  end

  def weight_price(total_amount=6600, area={_public: 3837, _private:  3832}, weight={_public: 4, _private: 6})
    avg_price =  6600 / (area[:_public] + area[:_private] * (weight[:_private]/weight[:_public].to_f))
    return {public_avg: avg_price, private_avg: (avg_price*weight[:_private]/weight[:_public].to_f)}
  end
end

Room.new.compute_rental(4, 6)
