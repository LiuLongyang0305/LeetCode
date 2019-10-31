//https://leetcode.com/problems/friends-of-appropriate-ages/
class Solution {
    func numFriendRequests(_ ages: [Int]) -> Int {
        var ans = 0
        let maxAge = ages.max()!
        var countAges = Array<Int>(repeating: 0, count: maxAge + 1)
        for age in ages {
            countAges[age] += 1
        }
        for ageA in 1..<countAges.count {
            let countA = countAges[ageA]
            for ageB in 0...ageA {
                if ageB <= ageA >> 1 + 7 {
                    continue
                }
                ans += countA * countAges[ageB]
                if ageB == ageA {
                    ans -= countA
                }
            }
        }
        return ans
    }
}