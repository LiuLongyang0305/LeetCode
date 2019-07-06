//https://leetcode.com/problems/last-stone-weight/
class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        guard stones.count >= 1 else {
            return stones[0]
        }
        var stonesCopy = stones
        while stonesCopy.count > 1 {
            stonesCopy.sort()
            let a = stonesCopy.removeLast()
            let b = stonesCopy.removeLast()
            if a != b {
                stonesCopy.append(a - b)
            }
        }
        return stonesCopy.count == 0 ? 0 : stonesCopy[0]
    }
}