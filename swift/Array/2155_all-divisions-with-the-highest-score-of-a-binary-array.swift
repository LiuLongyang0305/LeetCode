// https://leetcode.com/problems/all-divisions-with-the-highest-score-of-a-binary-array/
class Solution {
    func maxScoreIndices(_ nums: [Int]) -> [Int] {
        let totalOneCnt = nums.reduce(0) {$0 + $1}
        var score = totalOneCnt
        var indices = [0]
        let N = nums.count
        if N - totalOneCnt > totalOneCnt {
            indices = [N]
            score = N - totalOneCnt
        } else if N - totalOneCnt == score {
            indices.append(N)
        }
        
        var zeroCnt = 0
        var oneCnt = 0
        for splitPoint in 1..<N {
            if nums[splitPoint - 1] == 0 {
                zeroCnt += 1
            } else {
                oneCnt += 1
            }
            let s = zeroCnt + (totalOneCnt - oneCnt)
            if s > score {
                score = s
                indices = [splitPoint]
            } else if s == score {
                indices.append(splitPoint)
            }
        }
        return indices
    }
}