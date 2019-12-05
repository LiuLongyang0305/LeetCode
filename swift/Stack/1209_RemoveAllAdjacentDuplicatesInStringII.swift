//https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/
class Solution {
    typealias Counter = (total:Int,char:Character)
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        guard k <= s.count else {
            return s
        }
        guard k != 1 else {
            return ""
        }
        var stack = [Counter]()
        for ch in s {
            if let lastCounter = stack.last, lastCounter.char == ch {
                if lastCounter.total + 1 == k {
                    stack.removeLast()
                } else {
                    stack[stack.count - 1].total = lastCounter.total + 1
                }
                continue
            }
            stack.append((1,ch))
        }
        var ans = ""
        for counter in stack {
            if counter.total == 1 {
                ans.append(counter.char)
            } else {
                ans += String(Array<Character>(repeating: counter.char, count: counter.total))
            }
        }
        return ans
    }
 }
 
 
 

