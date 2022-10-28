// https://leetcode.com/problems/stone-game-vi/
class Solution {
    func stoneGameVI(_ aliceValues: [Int], _ bobValues: [Int]) -> Int {
        let N = aliceValues.count
        let sortedIdx = (0..<N).sorted { i, j in
            aliceValues[i] + bobValues[i] > aliceValues[j] + bobValues[j]
        }
        var aliceSum = 0
        var bobSum = 0

        for i in 0..<N {
            if i & 1 == 0 {
                aliceSum += aliceValues[sortedIdx[i]]
            } else {
                bobSum += bobValues[sortedIdx[i]]
            }
        }
        return aliceSum > bobSum ? 1 : (aliceSum == bobSum ? 0 : -1)
    }
}