// https://leetcode-cn.com/problems/he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof/
class Solution {
     func findContinuousSequence(_ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        let N = target >> 1 + 1
        let numbers = Array<Int>(0...N)
        var left = 1
        var right = 1
        var sum = 0
        while right <= N {
            sum += numbers[right]
            while sum > target {
                sum -= numbers[left]
                left += 1
            }
            if sum == target {
                ans.append(Array<Int>(numbers[left...right]))
            }
            right += 1
        }
        return ans
     }
 }