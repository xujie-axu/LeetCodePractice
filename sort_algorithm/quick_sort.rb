#encoding: utf-8
class SortAlgorithm

  UNORDERED_ARR = [1,4,6,3,2,7,8,5,11,3,4,45,9]
  @@count = 0

  ##
  # ==== Description
  #   快速排序(升序)
  #
  # ==== Principle
  #  选择一个基准元素,通常选择第一个元素或者最后一个元素,
  #  通过一趟排序将待排序的记录分割成独立的两部分，其中一部分记录的元素值均比基准元素值小。另一
  #  部分记录的 元素值比基准值大。
  #  此时基准元素在其排好序后的正确位置
  #  然后分别对这两部分记录用同样的方法继续进行排序，直到整个序列有序。
  #
  # ==== Procedure
  #  1．i =L; j = R; 将基准数挖出形成第一个坑a[i]。
  #  2．j--由后向前找比它小的数，找到后挖出此数填前一个坑a[i]中。
  #  3．i++由前向后找比它大的数，找到后也挖出此数填到前一个坑a[j]中。
  #  4．再重复执行2，3二步，直到i==j，将基准数填入a[i]中。
  #
  #
  # 待排数组： [1  4  6  3  2  7  5]
  # |基准数|      排序过程       |
  # |  1   |   _  4  6  3  2  7  5|
  # 待排数组： 1 [4  6  3  2  7  5]
  # |  4   |   1  _  6  3  2  7  [5]|
  # |  4   |   1  _  6  3  2  [7] 5 |
  # |  4   |   1 [2] 6  3  _  7  5 |
  # |  4   |   1  2  _  3 [6] 7  5 |
  # |  4   |   1  2 [3] _  6  7  5 |
  # 待排数组： [1 2 3] 4 [ 6 7 5]
  #   [3 6 7 5]
  #   |基准数|  排序过程  |
  #   |  6   | _  7  5 |
  #   |  6   | _  7  5 |
  #   |  6   | _  7  5 |
  #
  #
  def quick_sort(unorder, low, high)
    unorder = unorder.nil? ? UNORDERED_ARR : unorder
    low = low.nil? ? 0 : low
    high = high.nil? ? (unorder.size - 1) : high

    puts "**************************排序开始******************************"
    start_time = Time.now
    puts "需排序的数组为：#{unorder}"

    if(low < high)
      i, j, pivot = low, high, unorder[low]

      while i < j
        # 从右往左找比基数小的数, 找到就跳出while循环
        while (i < j && unorder[j] >= pivot)
          j -= 1
        end
        # 将找到的小数 填入挖出来的坑中，当前挖出的坑位为unorder[i], 挖的坑i被填了
        if (i < j)
          unorder[i] = unorder[j]
          i += 1
        end

        # 从左往右找比基数大的数，找到就跳出while循环
        while (i < j && unorder[i] <= pivot)
          i += 1
        end
        # 将找到的大数,填入刚挖的坑里, 当前挖出的坑位为unorder[j], 挖的坑j被填了
        if (i < j)
          unorder[j] = unorder[i]
          j -= 1
        end
      end

      # 结束循环，此时i=j,将基数放入坑中，基数左边的数都比基数小，右边的都比基数大
      unorder[i] = pivot

      # 递归调用
      quick_sort(unorder, low, i - 1)
      quick_sort(unorder, i + 1, high)
    end

    @@count += 1
    puts "#{@@count}: #{unorder}"
    puts "总耗时： #{Time.now - start_time}s"
    puts "**************************排序结束******************************"
  end
end


SortAlgorithm.new.quick_sort(nil,nil,nil)
