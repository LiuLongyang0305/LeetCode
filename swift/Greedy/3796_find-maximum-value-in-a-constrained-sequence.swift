    //https://leetcode.cn/problems/find-maximum-value-in-a-constrained-sequence
    class Solution {
        func findMaxVal(_ n: Int, _ restrictions: [[Int]], _ diff: [Int]) -> Int {
            var maxVals = [Int](repeating: Int.max, count: n)
            for r in restrictions {
                maxVals[r[0]] = r[1]
            }
            var sb = [Int](repeating: 0, count: n)
            for i in stride(from: 0, to: n - 1, by: 1) {
                sb[i + 1] = min(sb[i] + diff[i],maxVals[i + 1])
            }
            for i in stride(from: n - 2, to: 0, by: -1){
                sb[i] = min(sb[i], sb[i + 1] + diff[i])
            }
            return sb.max()!
        }
    }
