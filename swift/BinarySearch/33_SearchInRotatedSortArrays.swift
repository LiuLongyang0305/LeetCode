//https://leetcode.com/problems/search-in-rotated-sorted-array/
class Solution {
    var numbers = [Int]()
    var target = -1
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        guard nums.count > 1 else {
            return nums[0] == target ? 0 :  -1
        }
        let rotateIndex = nums.firstIndex(of: nums.min()!)!
        numbers = nums
        self.target = target
        let  ans = binarySearch(from: 0, to: rotateIndex - 1)
        if  ans != -1 {
            return ans
        }
        return binarySearch(from: rotateIndex, to: nums.count - 1)
    }
    private func binarySearch(from: Int, to: Int) -> Int{
        var left = from
        var right = to
        while left < right {
            let mid = left +  (right - left) >> 1
            if numbers[mid] == target {
                return mid
            }  else if numbers[mid] > target {
                right =  mid
            }  else {
                left = mid + 1
            }
        }
        return numbers[left] == target ? left : -1
    }
}
class Solution2 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard let index = nums.firstIndex(of: target) else {
            return -1
        }
        return index
    }
}