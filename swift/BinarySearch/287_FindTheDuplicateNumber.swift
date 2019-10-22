// https://leetcode.com/problems/find-the-duplicate-number/
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var tortoise  = nums[0]
        var hare = nums[0]
        repeat {
            tortoise = nums[tortoise]
            hare = nums[nums[hare]]
        } while tortoise != hare
        var part1 = nums[0]
        var part2 = tortoise
        while part1 != part2 {
            part1 =  nums[part1]
            part2 = nums[part2]
        }
        return part1
    }
}