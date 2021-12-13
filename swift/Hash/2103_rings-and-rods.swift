// https://leetcode.com/problems/rings-and-rods/
class Solution {
    func countPoints(_ rings: String) -> Int {
        var ringsOfEachStick = [Character:Set<Character>]()
        let ringsChar = [Character](rings)
        let N = rings.count
        for i in stride(from: 1, to: N, by: 2) {
            ringsOfEachStick[ringsChar[i],default: []].insert(ringsChar[i - 1])
        }
        var ans = 0
        for (_,s) in ringsOfEachStick {
            if s.count == 3 {
                ans += 1
            }
        }
        return ans
    }
}
