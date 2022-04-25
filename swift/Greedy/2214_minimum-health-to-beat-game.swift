// https://leetcode.com/problems/minimum-health-to-beat-game/
class Solution {
    func minimumHealth(_ damage: [Int], _ armor: Int) -> Int {
        let total = damage.reduce(0) { $0 + $1}
        let maxDamage = damage.max()!
        if maxDamage < armor {
            return total - maxDamage + 1
        }
        return total - armor + 1
    }
}