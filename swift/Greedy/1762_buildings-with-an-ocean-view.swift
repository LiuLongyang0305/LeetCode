// https://leetcode.com/problems/buildings-with-an-ocean-view/
class Solution {
    func findBuildings(_ heights: [Int]) -> [Int] {
        var rightMaxHeight = Int.min
        let N = heights.count
        var ans = [Int]()
        for idx in stride(from: N - 1, through: 0, by: -1) {
            if heights[idx] > rightMaxHeight {
                ans.insert(idx, at: 0)
                rightMaxHeight = heights[idx]
            }
        }
        return ans
    }
}
