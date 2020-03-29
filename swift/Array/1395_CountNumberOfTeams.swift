// https://leetcode.com/problems/count-number-of-teams/
class Solution {
    func numTeams(_ rating: [Int]) -> Int {
        let N = rating.count
        guard N >= 3 else {
            return 0
        }
        var ans = 0
        for i in 0..<(N - 2) {
            for j in (i + 1)..<(N - 1) {
                for k in (j + 1)..<N {
                    if (rating[i] > rating[j] && rating[j] > rating[k]) || (rating[i] < rating[j] && rating[j] < rating[k]) {
                        ans += 1
                    }
                }
            }
        }
        return ans
    }
}