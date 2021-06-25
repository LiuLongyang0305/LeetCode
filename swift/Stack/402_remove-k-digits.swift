//https://leetcode.com/problems/remove-k-digits/submissions/
class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        guard k != num.count else {
            return "0"
        }
        var stack = ""
        var cnt = 0
        for ch in num {
            while !stack.isEmpty  && stack.last! > ch && cnt < k{
                cnt += 1
                stack.removeLast()
            }
            stack.append(ch)
        }
        while cnt < k {
            stack.removeLast()
            cnt += 1
        }
        while !stack.isEmpty && stack.first! == "0" {
            stack.removeFirst()
        }
        return stack.isEmpty ? "0" : stack
    }
}

