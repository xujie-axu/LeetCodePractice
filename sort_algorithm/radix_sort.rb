#encoding: utf-8
class SortAlgorithm

  UNORDERED_ARR = [1,4,236,3,2,7,8,5,11,3,4,45,9,123]

  ##
  # ==== Description
  #   基数排序
  #
  # ==== Procedure
  #   通过序列中各个元素的值，对排序的N个元素进行若干趟的“分配”与“收集”来实现排序。
  #   分配：我们将L[i]中的元素取出，首先确定其个位上的数字，根据该数字分配到与之序号相同的桶中
  #   收集：当序列中所有的元素都分配到对应的桶中，再按照顺序依次将桶中的元素收集形成新的一个待序
  #   列L[  ]
  #   对新形成的序列L[]重复执行分配和收集元素中的十位、百位...直到分配完该序列中的最高位，则排序
  #   结束
  #
  # ==== Params
  #
  #
  def radix_sort(unorder)
    unorder = unorder.nil? ? UNORDERED_ARR : unorder
    puts "**************************排序开始******************************"
    start_time = Time.now
    puts "需排序的数组为：#{unorder}"

    order = []
    # 数字为0..9的十个桶的数组
    bukects = []
    # 每个桶里待排序数字的个数, 数组下标代表桶的编号
    count   = []
    # 每个桶所在未排序数组上的起始位置
    first_index = []

    # 将各元素的某一位(从个位开始进行排序)放入0..9是个桶内
      (0..get_sort_times(unorder)).each do |idx|

        (0..9).each {|i| count << 0; bukects[i] = []}


        puts "第#{idx}位开始排序"
        unorder.each do |num|
          r = get_pos_num(num, idx)
          bukects[r] << num
          count[r] += 1
        end

        # 记录每个桶在待排序数组上的起始位置
        (0..9).each do |res|
          if res == 0
            first_index[res] = 0
          else
            first_index[res] = first_index[res - 1] + count[res-1]
          end
        end

        # 将当前位排好的数放入待排序列表中
        first_index.each_with_index do |_count, index|
          if count[index] != 0
            (0..count[index]-1).each do |relative|
              cur_bukect = bukects[index]
              unorder[_count+relative] = cur_bukect[relative]
            end
          end
        end
        puts unorder.compact!
        puts unorder.to_s
        puts "==================="
      end

      puts order
      puts "总耗时： #{Time.now - start_time}s"
      puts "**************************排序结束******************************"
  end

  # 获取待排数字某位数的数字
  # example:
  #  get_pos_num(48, 0)
  #  => 8
  #
  #  get_pos_num(48, 1)
  #  => 4
  #
  def get_pos_num(num, pos)
    _num = num / (10 ** pos)
    _num % 10
  end

  # 获取待排数字中最大数的位数，表示要进行几次大排序
  def get_sort_times(unorder)
    max = unorder[0]
    (1..unorder.size-1).each do |i|
      max = max < unorder[i] ? unorder[i] : max
    end
    # 0代表个位，1代表十位，以此类推
    times = 0
    loop do
      if max > 9
        max = max / 10
        times += 1
      else
        break
      end
    end
    times
  end
end

SortAlgorithm.new.radix_sort(nil)
