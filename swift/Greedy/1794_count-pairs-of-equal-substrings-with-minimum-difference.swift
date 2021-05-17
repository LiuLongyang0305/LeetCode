// https://leetcode.com/problems/count-pairs-of-equal-substrings-with-minimum-difference/
class Solution {
    func countQuadruples(_ firstString: String, _ secondString: String) -> Int {
        let firstIndices = getIndices([Character](firstString), true)
        let secondIndices = getIndices([Character](secondString),false)
        var ans = 0
        var minDis = Int.max
        for idx in 0..<26 {
            guard firstIndices[idx] != -1 && secondIndices[idx] != -1 else {
                continue
            }
           let dis = firstIndices[idx] - secondIndices[idx]
            guard dis <= minDis else {
                continue
            }
            if dis < minDis {
                minDis = dis
                ans = 1
            } else {
                ans += 1
            }
        }
        return ans
    }
    private func getIndices(_ chars: [Character],_ isMinIndex: Bool) -> [Int] {
        var ans = Array<Int>(repeating: -1, count: 26)
        let s = [Int](0..<chars.count)
        let indexSequence = isMinIndex ? s : [Int](s.reversed())
        for idx in indexSequence {
            let t = Int(chars[idx].asciiValue! - 97)
            if ans[t] == -1 {
                ans[t] = idx
            }
        }
        return ans
    }
}
