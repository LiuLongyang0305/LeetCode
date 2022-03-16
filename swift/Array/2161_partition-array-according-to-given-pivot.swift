//https://leetcode-cn.com/problems/partition-array-according-to-given-pivot/
class Solution {
    func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
        var left = [Int]()
        var middle = [Int]()
        var right = [Int]()
        for num in nums {
            if num == pivot {
                middle.append(num)
            } else if num < pivot {
                left.append(num)
            } else {
                right.append(num)
            }
        }
        return left + middle + right
    }
}