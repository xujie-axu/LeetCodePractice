#encoding: utf-8
class SortAlgorithm

  UNORDERED_ARR = [1,4,6,3,2,7,8,5,11,3,4,45,9]
  @@count = 0

  def quick_sort(unorder, low, high)
    unorder = unorder.nil? ? UNORDERED_ARR : unorder
    low = low.nil? ? 0 : low
    high = high.nil? ? (unorder.size - 1) : high

    puts "low: #{low}, high: #{high}"

    if(low < high)
      i, j, pivot = low, high, unorder[low]

      while i < j
        while (i < j && unorder[j] >= pivot)
          j -= 1
        end
        if (i < j)
          unorder[i] = unorder[j]
          i += 1
        end

        while (i < j && unorder[i] <= pivot)
          i += 1
        end
        if (i < j)
          unorder[j] = unorder[i]
          j -= 1
        end
      end

      unorder[i] = pivot

      quick_sort(unorder, low, i - 1)
      quick_sort(unorder, i + 1, high)
    end

    @@count += 1
    puts "#{@@count}: #{unorder}"

  end
end

SortAlgorithm.new.quick_sort(nil,nil,nil)
