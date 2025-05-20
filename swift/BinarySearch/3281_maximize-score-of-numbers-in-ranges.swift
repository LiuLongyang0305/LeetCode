//https://leetcode.cn/problems/maximize-score-of-numbers-in-ranges/
class Solution {
    func maxPossibleScore(_ start: [Int], _ d: Int) -> Int {
        let sortedStart = start.sorted()


        func check(_ score: Int) -> Bool {
            var x = Int.min
            for s in sortedStart {
                x = max(x + score,s)
                guard x <= s + d else {return false}
            }
            return true
        }
        let N = start.count
        var left = 0
        var right = (sortedStart[ N - 1] + d - sortedStart[0]) / (N - 1) + 1
        while left + 1 < right {
            let mid = (left + right) >> 1
            if check(mid) {
                left = mid
            } else {
                right = mid
            }
        }
        return left
    }
}