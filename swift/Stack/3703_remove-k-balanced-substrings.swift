// https://leetcode.cn/problems/remove-k-balanced-substrings/
class Solution {
    private typealias Pair = (val:Character, cnt:Int)
    func removeSubstring(_ s: String, _ k: Int) -> String {
        var stack = [Pair]()
        for ch in s {
            if (stack.last?.val ?? " ") != ch {
                stack.append((ch,1))
            } else {
                stack[stack.count - 1].cnt += 1
            }
            if let p = stack.last, p.val == ")" && p.cnt == k {
                let M = stack.count
                if M > 1 && stack[M - 2].val == "(" && stack[M - 2].cnt >= k {
                    if stack[M - 2].cnt == k {
                        stack.removeLast(2)
                    } else {
                        stack.removeLast()
                        stack[stack.count - 1].cnt -= k
                    }

                }
            }
        }
        var sb = ""
        for (ch,cnt) in stack {
            sb += String(String(repeating: ch, count: cnt))
        }
        return sb
    }
}
