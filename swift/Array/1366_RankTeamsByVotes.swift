// https://leetcode.com/problems/rank-teams-by-votes/
 class Solution {
    func rankTeams(_ votes: [String]) -> String {
        guard votes.count > 1 else {
            return votes[0]
        }
        guard Set<Character>(votes[0]).count > 1 else {
            return votes[0]
        }
        let numberOfTeams = votes[0].count
        
        var counters = [Character:[Int]]()
        votes[0].forEach { counters.updateValue(Array<Int>(repeating: 0, count: numberOfTeams), forKey: $0)}
        votes.map {[Character]($0)}.forEach { (vote) in
            for i in 0..<numberOfTeams {
                if var c = counters[vote[i]] {
                    c[i] += 1
                    counters[vote[i]] = c
                }
            }
        }
        let sortedCounter = counters.sorted { (dic1, dic2) -> Bool in
            let value1 = dic1.value
            let value2 = dic2.value
            
            for i in 0..<numberOfTeams {
                if value1[i] != value2[i] {
                    return value1[i] > value2[i]
                }
            }
            return dic1.key < dic2.key
        }
        var ans = ""
        sortedCounter.forEach { ans.append($0.key)}
        return ans
    }
 }
 
