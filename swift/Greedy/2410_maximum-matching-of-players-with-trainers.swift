// https://leetcode.com/problems/maximum-matching-of-players-with-trainers/
class Solution {
    func matchPlayersAndTrainers(_ players: [Int], _ trainers: [Int]) -> Int {
        let sortedPlayers = players.sorted()
        let sortedTrainners = trainers.sorted()
        let M = sortedTrainners.count
        var ans = 0
        var j = 0
        for player in sortedPlayers {
            while j < M && sortedTrainners[j] < player {
                j += 1
            }
            if j < M {
                ans += 1
                j += 1
            }
            guard j < M else {break}
        }
        return ans
    }
}