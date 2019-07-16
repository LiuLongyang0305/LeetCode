//https://leetcode.com/problems/jewels-and-stones/
class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var ans = 0
        let jewels = Set<Character>(J)
        for stone in S {
            if jewels.contains(stone) {
                ans += 1
            }
        }
        return ans
    }
}