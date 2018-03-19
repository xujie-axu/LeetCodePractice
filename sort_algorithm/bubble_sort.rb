class SortAlgorithm
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
    puts "**************************排序结束******************************"
  end

end