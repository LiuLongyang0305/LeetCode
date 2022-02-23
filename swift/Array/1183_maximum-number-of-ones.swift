//  https://leetcode.com/problems/maximum-number-of-ones/
class Solution {
    func maximumNumberOfOnes(_ width: Int, _ height: Int, _ sideLength: Int, _ maxOnes: Int) -> Int {
        let rows = (0..<width).map { $0 % sideLength}
        let cols = (0..<height).map { $0 % sideLength}
        var map = [Int:Int]()
        for r in 0..<width {
            for c in 0..<height {
                map[(rows[r] << 10) | cols[c], default: 0] += 1
            }
        }
        var ans = 0
        let sortedMap = map.sorted { $0.value > $1.value}
        for i in 0..<maxOnes {
            ans += sortedMap[i].value
        }
        return ans
    }
}