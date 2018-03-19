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
  def insert_sort(unorder)
    unorder = unorder.present? ? unorder : UNORDERED_ARR
    len = unorder.size
    order = []
    order << unorder[0]
    puts "**************************排序开始******************************"
    start_time = Time.now
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
    puts "总耗时： #{Time.now - start_time}"
    puts "**************************排序结束******************************"
  end

  ##
  # ==== Description
  #   选择排序(升序)
  #
  # ==== Procedure
  #   1.首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置
  #   2.再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
  #   3.重复第二步，直到所有元素均排序完毕。
  #
  def select_sort(unorder)
    unorder = unorder.nil? ? UNORDERED_ARR : unorder
    len = unorder.size
    order = []
    count = 1
    puts "**************************排序开始******************************"
    start_time = Time.now
    puts "需排序的数组为：#{unorder}"
    loop do
      # count为比较次数，一共比较(unorder.size) 次比较到最后一个元素，则跳出循环比较
      if count == len
        order << unorder[0]
        break
      end

      puts "第#{count}次排序,带排序的数组为：#{unorder}"
      # 找出未排序的数组里的最小值
      smallest = unorder[0]
      smallest_index = 0
      (1..unorder.size - 1).each do |i|
        if unorder[i] < smallest
          smallest       = unorder[i]
          smallest_index = i
        end
      end

      unorder.delete_at(smallest_index)
      order << smallest
      puts "第#{count}次排序最小的元素为：#{smallest}, 该元素所在位置为：#{smallest_index}"
      puts "第#{count}次排序数组为：#{order}"
      puts "================================================================="

      count += 1
    end
    puts "#{order}"
    puts "总耗时： #{Time.now - start_time}"
    puts "**************************排序结束******************************"
  end

  ##
  # ==== Description
  #   冒泡排序(升序)
  #
  # ==== Principle
  #   重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。
  #   走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。
  #   这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。
  #
  # ==== Procedure
  #   1.比较相邻的元素。如果第一个比第二个大，就交换他们两个。
  #   2.对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
  #   3.针对所有的元素重复以上的步骤，除了最后一个。
  #   4.持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。
  #
  def bubble_sort(unorder)
    unorder = unorder.nil? ? UNORDERED_ARR : unorder
    len = unorder.size
    puts "**************************排序开始******************************"
    start_time = Time.now
    puts "需排序的数组为：#{unorder}"
    (0..(len-1)).each do |i|
      (i..(len - 1)).each do |j|
        if unorder[i] > unorder[j]
          tmp = unorder[j]
          unorder[j] = unorder[i]
          unorder[i] = tmp
        end
      end
      puts "第#{i+1}次排序:#{unorder}"
      puts "================================================================="
    end
    order = unorder
    puts "#{order}"
    puts "总耗时： #{Time.now - start_time}"
    puts "**************************排序结束******************************"
  end
end
