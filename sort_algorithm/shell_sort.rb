class SortAlgorithm

  UNORDERED_ARR = [1,4,6,3,2,7,8,5,11,3,4,45,9]

  ##
  # ==== Description
  #   希尔排序
  #
  # ==== Principle
  #   将待排序数组按照步长gap进行分组，然后将每组的元素利用直接插入排序的方法进行排序；
  #   每次将gap折半减小，循环上述操作；当gap=1时，利用直接插入，完成排序。
  #
  # ==== Procedure
  #   将gap依次折半，对序列进行分组，直到gap=1
  #
  def shell_sort(unorder)
    unorder = unorder.nil? ? UNORDERED_ARR : unorder
    len = unorder.size
    gap = len
    gap_list = []

    # 获取每次比较的子集个数
    loop do
      gap = gap / 2
      gap_list << gap
      if gap == 1
        break
      else
        (1..gap-1).each do |i|
          cur_element = unorder[i]
          cur_order_len = len/gap

          (cur_order_len - 1).downto(0) do |j|
            if cur_element < unorder[j]
              unorder[j+gap] = unorder[j]
              unorder[gap] = cur_element
            else
              unorder[j+gap] = cur_element
            end
          end
        end
      end
    end

    puts unorder.to_s
  end
end

SortAlgorithm.new.shell_sort(nil)
