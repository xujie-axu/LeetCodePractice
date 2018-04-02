#encoding: utf-8
class SortAlgorithm

  UNORDERED_ARR = [1,4,6,3,2,7,8,5,11,3,4,45,9]
  @@count = 0

  ##
  # ==== Description
  #   归并排序
  #
  # ==== Principle
  #  将已有的子序列合并，达到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。
  #  最小单位为1的子序列认为是有序
  #
  # ==== Procedure
  #
  def merge_sort(unorder)
    unorder = unorder.nil? ? UNORDERED_ARR : unorder
    tmp_arr = []
    start_time = Time.now
    divide_arr(unorder, 0, unorder.size - 1, tmp_arr)
    puts "归并排序总耗时：#{Time.now - start_time}s"
  end

  def merge_array(arr, first, mid, last, tmp_arr)
    i, j, k = first, mid + 1, 0
    # 将数组分为两个序列，比较得到较小的数
    while (i <= mid && j <= last)
      if arr[i] <= arr[j]
        tmp_arr[k] = arr[i]
        i += 1
        k += 1
      else
        tmp_arr[k] = arr[j]
        j += 1
        k += 1
      end
    end

    # 如果右边序列还有数
    while i <= mid
      tmp_arr[k] = arr[i]
        i += 1
        k += 1
    end

    # 如果右边序列还有数
    while j <= last
        tmp_arr[k] = arr[j]
        j += 1
        k += 1
    end

    #将temp当中该段有序元素赋值给L待排序列使之部分有序
    (0..k-1).each do |x|
      arr[first + x] = tmp_arr[x]
      #puts tmp_arr[x]
    end
    @@count += 1
    puts "第#{@@count}次排序："
    puts arr.to_s
    puts "==============="
    arr
  end

  def divide_arr(arr, first, last, tmp_arr)
    if first < last
      mid = (last + first) / 2
      divide_arr(arr, first, mid, tmp_arr)
      divide_arr(arr, mid + 1, last, tmp_arr)
      merge_array(arr, first, mid, last, tmp_arr)
    end
    arr
  end

  SortAlgorithm.new.merge_sort(UNORDERED_ARR)
end
