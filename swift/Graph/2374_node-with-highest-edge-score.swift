// https://leetcode.com/problems/node-with-highest-edge-score/
class Solution {
    func edgeScore(_ edges: [Int]) -> Int {
        let N = edges.count
        var score = [Int](repeating: 0, count: N)
        for i in 0..<N {
            score[edges[i]] += i
        }
        let maxScore = score.max() ?? 0
        return score.firstIndex(of: maxScore) ?? -1
    }
}