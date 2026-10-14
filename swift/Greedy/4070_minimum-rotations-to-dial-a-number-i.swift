    // https://leetcode.cn/problems/minimum-rotations-to-dial-a-number-i/
class Solution {
    func minRotations(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        let nums = s.compactMap { $0.wholeNumberValue }
        func dis(_ a: Int, _ b: Int) -> Int {
            let delta = abs(a - b)
            return min(delta, 10 - delta)
        }

        var last = 0
        var sb = 0
        for num in nums {
            
            sb += dis(last, num)
            last = num
        }
        return sb
    }
}
