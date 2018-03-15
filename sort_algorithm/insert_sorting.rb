class SortAlgorithm

  UNORDERED_ARR = [1,4,6,3,2,7,8,5,11,3,4,45,9]

  ##
  # ==== Description
  #   插入排序(升序)
  #
  # ==== Principle
  #   通过构建有序序列，对于未排序数据，
  #   在已排序序列中从后向前扫描，找到相应位置并插入。
  #
  # ==== Procedure
  #   1.将第一待排序序列第一个元素看做一个有序序列，把第二个元素到最后一个元素当成是未排序序列。
  #   2.从头到尾依次扫描未排序序列，将扫描到的每个元素插入有序序列的适当位置。
  #   （如果待插入的元素与有序序列中的某个元素相等，则将待插入元素插入到相等元素的后面。）
  #
  def insert_sort
    unorder = UNORDERED_ARR
    len = unorder.size
    order = []
    order << unorder[0]
    puts "需要进行排序的数组:#{unorder.flatten}"
    (1..(len-1)).each do |idx|
      cur_element = unorder[idx]
      cur_order_len = order.size

      puts "第#{idx}次插入，插入元素：#{cur_element}"
      (cur_order_len - 1).downto(0) do |j|
        if cur_element < order[j]
          order[j+1] = order[j]
          order[j] = cur_element
          puts "第#{idx}次插入情况(与#{order[j+1]}进行比较)：#{order.to_s}"
        else
          order[j+1] = cur_element
          puts "第#{idx}次插入输出(插入元素:#{cur_element})：#{order.to_s}\n"
          puts "============================================================"
          break
        end
      end
    end
    puts "插入排序：#{order}"
  end
end
