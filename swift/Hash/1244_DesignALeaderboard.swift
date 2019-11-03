//https://leetcode.com/contest/biweekly-contest-12/problems/design-a-leaderboard/
class Leaderboard {

    private var palyersAndScores = [Int: Int]()
    init() {
        
    }
    
    func addScore(_ playerId: Int, _ score: Int) {
        if let s  = palyersAndScores[playerId] {
            palyersAndScores.updateValue(s + score, forKey: playerId)
        } else {
            palyersAndScores.updateValue(score, forKey: playerId)
        }
    }
    
    func top(_ K: Int) -> Int {
        let sortedScores =  palyersAndScores.values.sorted { $0 > $1}
        var ans = 0
        for i in 0..<K {
            ans += sortedScores[i]
        }
        return ans
    }
    
    func reset(_ playerId: Int) {
        palyersAndScores.updateValue(0, forKey: playerId)
    }
}

/**
 * Your Leaderboard object will be instantiated and called as such:
 * let obj = Leaderboard()
 * obj.addScore(playerId, score)
 * let ret_2: Int = obj.top(K)
 * obj.reset(playerId)
 */