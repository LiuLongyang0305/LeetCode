//https://leetcode.com/problems/maximum-length-of-pair-chain/
class Solution {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let numberOfPairs = pairs.count
        let pairsCopy = pairs.sorted { (first, second) -> Bool in
            first[0] < second[0]
        }
        var dp = Array<Int>(repeating: 1, count: numberOfPairs)
        for j in 1..<numberOfPairs {
            for i in 0..<j {
                if pairsCopy[i][1] < pairsCopy[j][0] {
                    dp[j] = max(dp[j], dp[i] + 1)
                }
            }
        }
        return dp.max()!
    }
}

var pairs = [[1,2], [2,3], [3,4]]
Solution().findLongestChain(pairs)