class SortAlgorithm

  UNORDERED_ARR = [1,4,6,3,2,7,8,5,11,3,4,45,9]

  def shell_sort
    unorder = UNORDERED_ARR
    len = unorder.size
    gap = len
    gap_list = []

    # 获取每次比较的子集个数
    loop do
      gap = gap / 2
      gap_list << gap
      if gap == 1
        break
      end
    end

    puts "增量序列：#{gap_list}"

    gap_list.each do |cur_gap|
      chil_table_len = len / cur_gap
      (0..chil_table_len).each do |i|
        chil_table = []
        (0..cur_gap).each do |j|
        end

      end
    end




    unorder[0]
  end
end
