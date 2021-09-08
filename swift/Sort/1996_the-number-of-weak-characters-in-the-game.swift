//  https://leetcode.com/problems/the-number-of-weak-characters-in-the-game/
class Solution {
    func numberOfWeakCharacters(_ properties: [[Int]]) -> Int {
        let sortedByAttack = properties.sorted { p1, p2 in
            if p1[0] == p2[0] {
                return p1[1] < p2[1]
            }
            return p1[0] < p2[0]
        }
        let sortedByDefense = properties.sorted { p1, p2 in
            if p1[1] == p2[1] {
                return p1[0] < p2[0]
            }
            return p1[1] > p2[1]
        }
        let N = properties.count
        var ans = 0
        var idx = 0
        for p in sortedByAttack {
            while idx < N && sortedByDefense[idx][0] <= p[0] {
                idx += 1
            }
            guard idx < N else {
                break
            }
            if idx < N {
                if sortedByDefense[idx][1] > p[1] {
                    ans += 1
                }
            }
        }
        return ans
    }
}