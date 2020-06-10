// https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof/
class Solution {
    func translateNum(_ num: Int) -> Int {
        var memo = [String:Int]()
        func backTracking(_ s: String) -> Int {
            if let c = memo[s] {
                return c
            }
            guard s.count > 1 else {
                memo[s] = 1
                return 1
            }
            var cnt = 0
            var curStr = s
            let ch = curStr.removeFirst()
            cnt += backTracking(curStr)
            if !curStr.isEmpty {
                let curNum = "\(ch)\(curStr.removeFirst())"
                if curNum != "00" {
                    if let c = Int(curNum), c >= 10 && c <= 25 {
                        cnt += backTracking(curStr)
                    }
                }
            }
            memo[s] = cnt
            return cnt
        }
        backTracking("\(num)")
        return memo["\(num)"] ?? 0
    }
}