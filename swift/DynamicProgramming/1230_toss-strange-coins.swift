// https://leetcode.com/problems/toss-strange-coins/
class Solution {
    func probabilityOfHeads(_ prob: [Double], _ target: Int) -> Double {

        var map = [Int:Double]()
        map[0] = 1.0
        for p in prob {
            var new = [Int:Double]()
            let reverseProb = 1.0 - p
            for (cnt,prob) in map {
                new[cnt + 1, default: 0] += prob * p
                new[cnt,default: 0] += prob * reverseProb
            }
            map = new
        }

        return map[target] ?? 0
    }
}
