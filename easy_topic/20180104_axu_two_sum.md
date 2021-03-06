Two Sum
---------------------------
### Topic:
Given an array of integers, return indices of the two numbers such that they add up to a specific target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.

### Example
  Given nums = [2, 7, 11, 15], target = 9,

  Because nums[0] + nums[1] = 2 + 7 = 9,
  return [0, 1].

### Solution
#### Approach1:

```ruby
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  (0..(nums.size-1)).each do |idx|
    ((idx+1)..(nums.size-1)).each do |n|
      if (nums[idx] + nums[n]) == target
        return [idx, n]
      end
    end
  end
end
```
NOTE:
The algorithmic is passed the test, but the Time complexity : O(n²), so, I find the Approach2, as follows

### Approach2
```ruby
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  (0..(nums.size-1)).each do |idx|
    rest = target - nums[idx]
    if nums.include?(rest) && nums.index(rest) != idx
      return [idx, nums.index(rest)]
    end
  end
end
```

#### Answer Link
[ReferToTheGivenAnswer](https://leetcode.com/articles/two-sum/)
