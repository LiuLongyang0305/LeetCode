// https://leetcode.com/problems/mini-parser/
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    private var chars = [Character]()
    func deserialize(_ s: String) -> NestedInteger {
        self.chars = [Character](s)
        return helper(0,s.count - 1)
    }
    
    private func helper(_ left: Int, _ right: Int) -> NestedInteger {
        var ans = NestedInteger()

        print(String(chars[left...right]))
        guard right >= left else {
            return ans
        }
        guard chars[left] == "[" else {
            ans.setInteger(Int(String(chars[left...right]))!)
            return ans
        }
        
        var idx = left + 1
        var level = 0
        var last: Int? = nil
        
        while idx < right {
            if chars[idx].isNumber || chars[idx] == "-" {
                if nil == last {
                    last = idx
                }
                idx += 1
                continue
            }
            if chars[idx] == "," {
                if level == 0 {
                if let l = last {
                    ans.add(helper(l, idx - 1))
                    last = nil
                }
                }
                idx += 1
                continue
            }
            if chars[idx] == "[" {
                level += 1
                if nil == last {
                    last = idx
                }
                idx += 1
                continue
            }
            if chars[idx] == "]" {
                level -= 1
                if level == 0 {
                    if let l = last {
                        ans.add(helper(l, idx))
                        last = nil
                    }
                }
                idx += 1
                continue
            }
        }
        if let l = last {
            ans.add(helper(l, right - 1))
        }
        return ans
    }
}


