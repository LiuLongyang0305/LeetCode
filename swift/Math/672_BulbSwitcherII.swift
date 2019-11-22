//https://leetcode.com/problems/bulb-switcher-ii/
class Solution {
    func flipLights(_ n: Int, _ m: Int) -> Int {
        let size = min(n, 3)
        guard m != 0 else {
            return 1
        }
        guard m != 1 else {
            return[2,3,4][size - 1]
        }
        guard m != 2 else {
            return [2,4,7][size - 1]
        }
        return [2,4,8][size  - 1]
    }
}