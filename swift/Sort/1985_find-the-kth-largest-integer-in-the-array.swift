// https://leetcode.com/problems/find-the-kth-largest-integer-in-the-array/
class Solution {
    func kthLargestNumber(_ nums: [String], _ k: Int) -> String {
        let sortedNums = nums.sorted { num1, num2 in
            if num1.count == num2.count {
                return num1 > num2
            }
            return num1.count > num2.count
        }
        return sortedNums[k - 1]
    }
}