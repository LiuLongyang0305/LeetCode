// https://leetcode.com/problems/best-team-with-no-conflicts/
class Solution {
    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        guard scores.count > 1 else {
            return scores.isEmpty ? 0 : scores[0]
        }
        let sortedPlayers = zip(ages, scores).sorted { (p1, p2) -> Bool in
            if p1.0 == p2.0 {
                return p1.1 < p2.1
            }
            return p1.0 < p2.0
        }
        let N = sortedPlayers.count
        var dp = sortedPlayers.map { $0.1}
        for i in 1..<N {
            for j in 0..<i {
                if sortedPlayers[i].1 >= sortedPlayers[j].1 {
                    dp[i] = max(dp[i], dp[j] + sortedPlayers[i].1)
                }
            }
        }
        return dp.max()!
    }
}

