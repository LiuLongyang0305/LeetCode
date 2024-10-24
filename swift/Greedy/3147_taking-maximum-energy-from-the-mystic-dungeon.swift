// https://leetcode.cn/problems/taking-maximum-energy-from-the-mystic-dungeon
class Solution {
    func maximumEnergy(_ energy: [Int], _ k: Int) -> Int {
        let N = energy.count
        var ans = -1_000_000_007
        for end in stride(from: N - 1, through: N - k, by: -1) {
            var cur = 0
            for i in stride(from: end, through: 0, by: -k) {
                cur += energy[i]
                ans = max(ans,cur)
            }
        }

        return ans
    }
}