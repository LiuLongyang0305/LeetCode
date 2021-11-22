// https://leetcode.com/problems/watering-plants/
class Solution {
    func wateringPlants(_ plants: [Int], _ capacity: Int) -> Int {
        var ans = 0
        let N = plants.count
        var curWater = capacity
        var lastPos = -1
        var nextPos = 0
        while nextPos < N {
            if curWater >= plants[nextPos] {
                ans += nextPos - lastPos
                lastPos = nextPos
                curWater -= plants[nextPos]
                nextPos += 1
            } else {
                ans += lastPos + 1
                curWater = capacity
                lastPos = -1
                
            }
        }
        return ans
    }
}