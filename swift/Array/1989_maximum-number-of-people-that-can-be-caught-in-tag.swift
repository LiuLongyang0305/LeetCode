// https://leetcode-cn.com/problems/maximum-number-of-people-that-can-be-caught-in-tag/
class Solution {
    func catchMaximumAmountofPeople(_ team: [Int], _ dist: Int) -> Int {
        var ans = 0
        let N = team.count
        var zeros = [Int]()
        for idx in 0..<N where team[idx] == 0 {
            zeros.append(idx)
        }
        guard !zeros.isEmpty else {return 0}
        var zeroIdx = 0
        let M = zeros.count
        
        for idx in 0..<N {
            guard team[idx] == 1 else {continue}
            while zeroIdx < M  && idx - zeros[zeroIdx] > dist {
                zeroIdx += 1
            }
            guard zeroIdx < M else {break}
            if abs(zeros[zeroIdx] - idx) <= dist {
                ans += 1
                zeroIdx += 1
            }
        }
        return ans
    }
}