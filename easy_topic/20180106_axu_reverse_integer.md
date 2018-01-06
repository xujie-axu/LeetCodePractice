Reverse Integer
---------------------------

### Topic:
Given a 32-bit signed integer, reverse digits of an integer.

### Example
Example 1:
Input: 123
Output:  321

Example 2:
Input: -123
Output: -321

Example 3:
Input: 120
Output: 21

Note:
Assume we are dealing with an environment which could only hold integers within the 32-bit signed integer range. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

### Solution
#### Approach1
```ruby
# @param {Integer} x
# @return {Integer}
def reverse(x)
  arr = x.to_s.split("")
  sign = ''
  if arr[0] == '-'
    sign = arr.slice(0)
    arr = arr[1..-1]
  end
  result = (opr+arr.reverse.join("")).to_i

  if result > 2**31-1 || result < -2**31
    result = 0
  end

  return result
end
```

#### Answer Link
[ReferToTheGivenAnswer](https://leetcode.com/problems/reverse-integer)
