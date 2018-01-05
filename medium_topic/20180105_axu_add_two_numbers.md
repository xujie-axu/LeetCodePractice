Add Two Numbers
---------------------------
### Topic
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

### Example
**Input**: (2 -> 4 -> 3) + (5 -> 6 -> 4)
**Output**: 7 -> 0 -> 8
**Explanation**: 342 + 465 = 807.


### Solution
#### Approach1:

```ruby
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)

    sum  = l1.val + l2.val
    lead = sum /10
    val  = sum % 10
    result = ListNode.new(val)
    link_node = result
    loop do
        if l1.next != nil && l2.next != nil
            l1 = l1.next
            l2 = l2.next
            sum = l1.val + l2.val + lead
            lead = sum / 10
            val  = sum % 10
            next_result = ListNode.new(val)
            link_node.next = next_result
            link_node = link_node.next
        else
            if lead == 0
                if l1.next == nil && l2.next == nil
                    return result
                else
                    if l1.next != nil && l2.next == nil
                        val = l1.next.val
                        link_node.next = ListNode.new(val)
                        link_node = link_node.next
                    elsif l1.next == nil && l2.next != nil
                        val = l2.next.val
                        link_node.next = ListNode.new(val)
                        link_node = link_node.next
                    end
                end
            else
                val = lead
                link_node.next = ListNode.new(val)
                link_node = link_node.next
                lead = 0
            end
        end
    end
end
```

#### Answer Link
[ReferToTheGivenAnswer](https://leetcode.com/articles/add-two-numbers/)
