//https://leetcode.com/problems/smallest-range-ii/
class Solution {
    func smallestRangeII(_ A: [Int], _ K: Int) -> Int {
        let size = A.count
        let ACopy = A.sorted()
        var ans = ACopy[size - 1] - ACopy[0]

        for i in 0..<size - 1 {
            let a = ACopy[i]
            let b = ACopy[ i + 1]
            let maxEle = max(ACopy[size - 1] - K, a + K)
            let minEle = min(ACopy[0] + K, b - K)
            ans = min(ans, maxEle - minEle)
        }
        return ans
    }
}