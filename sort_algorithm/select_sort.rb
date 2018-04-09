#encoding: utf-8
class SortAlgorithm

  UNORDERED_ARR = [1,4,6,3,2,7,8,5,11,3,4,45,9]

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
end
SortAlgorithm.new.select_sort(nil)
