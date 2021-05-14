// https://leetcode.com/problems/reducing-dishes/
class Solution {
    func maxSatisfaction(_ satisfaction: [Int]) -> Int {
        let sortedSatisfaction = satisfaction.sorted {$0 > $1}
        var preffix = [0]
        for s in sortedSatisfaction {
            preffix.append(preffix.last! + s)
        }
        var ans = 0
        var total = 0
        for idx in 1...satisfaction.count {
            total += preffix[idx] 
            ans = max(ans, total)
        }
        
        return ans
    }
}