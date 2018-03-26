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
    puts "**************************排序开始******************************"
    start_time = Time.now
    puts "需排序的数组为：#{unorder}"

    (0..(len-1)).each do |i|
      smallest = unorder[i]

      ((i+1)..(len-1)).each do |j|
        tmp = 0
        if unorder[j] < smallest
          tmp = smallest
          smallest = unorder[j]
          unorder[j] = tmp
        end
      end

      unorder[i] = smallest
      puts "第#{i+1}次排序，最小的数为：#{smallest} , 排序结果：#{unorder}"
    end

    order = unorder
    puts "#{order}"
    puts "总耗时： #{Time.now - start_time}s"
    puts "**************************排序结束******************************"
  end
end
