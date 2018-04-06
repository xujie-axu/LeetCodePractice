class SortAlgorithm

  UNORDERED_ARR = [1,4,6,3,2,7,8,5,11,3,4,45,9]

  ##
  # ==== Description
  #   堆排序
  #
  # ==== Principle
  #  - 堆（二叉堆）可以视为一棵完全的二叉树，完全二叉树的一个“优秀”的性质是:除了最底层之外，每一层都是满的，
  #  这使得堆可以利用数组来表示（普通的一般的二叉树通常用链表作为基本容器表示），每一个结点对应数组中的一个元素。
  #
  #  - 根节点下标为0，对于给定的某个结点的下标 i，可以很容易的计算出这个结点的父结点、孩子结点的下标：
  #  Parent(i) = floor(i/2)，i 的父节点下标
  #  Left(i) = 2i + 1，i的左子节点下标
  #  Right(i) = 2(i + 1)，i的右子节点下标
  #
  #  - 二叉堆一般分为两种：最大堆和最小堆。
  #  最大堆：
  #    最大堆中的最大元素值出现在根结点（堆顶）
  #    堆中每个父节点的元素值都大于等于其孩子结点（如果存在）
  #  最小堆：
  #    最小堆中的最小元素值出现在根结点（堆顶）
  #    堆中每个父节点的元素值都小于等于其孩子结点（如果存在）
  #
  # ==== Procedure
  #  1. 将待排序的数组创建一个大顶堆;
  #  2. 将大顶堆的根节点（最大值）放入已排序数组中, 并从数组中移除该元素;
  #  3. 将剩下的数组看为一个新的待排序的数组，重复1，2步，直到待排数组只剩一个元素。
  #
  def heap_sort(unorder)
    unorder = unorder.nil? ? UNORDERED_ARR : unorder
    order = []
    puts "**************************排序开始******************************"
    start_time = Time.now
    puts "需要进行排序的数组:#{unorder.flatten}"
    loop do
      if unorder.size > 1
        puts "#{unorder.to_s}"
        heap = build_max_heap(unorder)
        max = heap[0]
        order << max
        puts "#{order.to_s}"
        unorder.delete_at(0)
      else
        order << unorder[0]
        break
      end
    end
    puts "堆排序：#{order}"
    puts "总耗时： #{Time.now - start_time}"
    puts "**************************排序结束******************************"
  end

  # 从最后的下标开始检查，创建大顶堆
  def build_max_heap(unorder)
    len = unorder.size
    (len-1).downto(0).each do |i|
      adjust_heap(unorder, i)
    end
    unorder
  end

  # 检查从i开始的小标，是否为大顶堆
  def adjust_heap(unorder, i)
    left_node  = left_node(i)
    right_node = right_node(i)
    len        = unorder.size

    if i < len && i >= 0
      if left_node < len && right_node < len
        if unorder[i] < unorder[left_node]
          unorder = swap(unorder, i, left_node)
          unorder = adjust_heap(unorder, i)
        elsif unorder[i] < unorder[right_node]
          unorder = swap(unorder, i, right_node)
          unorder = adjust_heap(unorder, i)
        else
          i = i - 1
          unorder = adjust_heap(unorder, i)
        end
      elsif left_node < len
        if unorder[i] < unorder[left_node]
          unorder = swap(unorder, i, left_node)
          unorder = adjust_heap(unorder, i)
        else
          i = i - 1
          unorder = adjust_heap(unorder, i)
        end
      elsif right_node < len
        if unorder[i] < unorder[right_node]
          unorder = swap(unorder, i, right_node)
          unorder = adjust_heap(unorder, i)
        else
          i = i - 1
          unorder = adjust_heap(unorder, i)
        end
      else
        i = i - 1
        unorder = adjust_heap(unorder, i)
      end
    end

    unorder
  end

  # 获取当前下标为i结点的左子节点下标
  def left_node(i)
    2 * i + 1
  end

  # 获取当前下标为i结点的右子节点下标
  def right_node(i)
    2 * (i + 1)
  end

  def swap(unorder, a, b)
    tmp = unorder[a]
    unorder[a] = unorder[b]
    unorder[b] = tmp
    unorder
  end

end

SortAlgorithm.new.heap_sort(nil)
