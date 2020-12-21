// https://leetcode.com/problems/maximum-erasure-value/
class Solution {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.isEmpty ? 0 : nums[0]
        }
        let N = nums.count
        var left = 0
        var right = 0
        var visited = Array<Int>(repeating: -1, count: nums.max()! + 1)
        var ans = Int.min
        var curSum = 0
        while right < N {
//            print("----------------------------")
            while right < N && visited[nums[right]] == -1 {
//                print("********* r = \(right)  num = \(nums[right])   visited = \(visited[nums[right]])")
                curSum += nums[right]
                visited[nums[right]] = right
//                print("&&&&&&&&  r = \(right)  num = \(nums[right])   visited = \(visited[nums[right]])")
                right += 1
            }
            ans = max(curSum, ans)
            while right < N && left < right && left <= visited[nums[right]] {
                curSum -= nums[left]
                visited[nums[left]] = -1
                left += 1
            }
        }
        return ans
    }
}
// let nums = [4,2,4,5,6]
// Solution().maximumUniqueSubarray(nums)

