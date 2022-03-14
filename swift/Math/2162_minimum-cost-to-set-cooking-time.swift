// https://leetcode.com/problems/minimum-cost-to-set-cooking-time/
class Solution {
    func minCostSetTime(_ startAt: Int, _ moveCost: Int, _ pushCost: Int, _ targetSeconds: Int) -> Int {
        var ans = Int.max
        
        func caculateCost(of num: Int) -> Int {
            
            var digits = [Int]()
            var numCopy = num
            while numCopy > 0 {
                digits.insert(numCopy % 10, at: 0)
                numCopy /= 10
            }
            var cost = 0
            var last = startAt
            
            for digit in digits {
                if last != digit {
                    cost += moveCost
                }
                cost += pushCost
                last = digit
            }
            
            return cost
        }
        for minutes in 0...99 {
            let seconds = targetSeconds - minutes * 60
            guard seconds >= 0 && seconds <= 99 else {continue}
            ans = min(ans, caculateCost(of: minutes * 100 + seconds))
        }
        return ans
    }
}