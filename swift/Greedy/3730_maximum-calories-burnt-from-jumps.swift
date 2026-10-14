//https://leetcode.cn/problems/maximum-calories-burnt-from-jumps/
class Solution {
    func maxCaloriesBurnt(_ heights: [Int]) -> Int {
        var sb = 0
        var sortedHeights = heights.sorted()
        let M = sortedHeights.count
        var last = 0
        var chooseHead = false
        var left = 0
        var right = M - 1

        while left <= right {
            if chooseHead {
                sb += (last - sortedHeights[left]) * (last - sortedHeights[left])
                last = sortedHeights[left]
                left += 1
            } else {
                sb += (last - sortedHeights[right]) * (last - sortedHeights[right])
                last = sortedHeights[right]
                right -= 1
            }
            chooseHead.toggle()
        }
        return sb
    }
}
