    // https://leetcode.cn/problems/elevator-requests-i/
    class Solution {
        func elevatorRequests(_ n: Int, _ requests: [Int]) -> Int {
            var sb = 0
            var last = 0
            for q in requests {
                sb += abs(q - last)
                last = q
            }
            return sb
        }
    }
