// https://leetcode.com/problems/minimum-adjacent-swaps-to-reach-the-kth-smallest-number/
class Solution {
    func getMinSwaps(_ num: String, _ k: Int) -> Int {
        var kCopy = k
        var originalNum = num.map { Int($0.asciiValue! - 48)}
        var newNum = originalNum
        while kCopy > 0 {
            nextPermutation(&newNum)
            kCopy -= 1
        }
        return countSteps(&originalNum, &newNum)
    }
    private func countSteps(_ originalNum:inout  [Int], _ newNum: inout [Int] ) -> Int {
        let size = originalNum.count
        var i = 0
        var j = 0
        var ans = 0
        while i < size {
            j = i
            while originalNum[j] != newNum[i] {
                j += 1
            }
            while i < j {
                originalNum.swapAt(j, j - 1)
                j -= 1
                ans += 1
            }
            i += 1
        }
        return ans
    }
    private func nextPermutation(_ nums: inout [Int]) {
        var left: Int = nums.count - 2
        while left >= 0 && nums[left] >= nums[left + 1] {
            left -= 1
        }
        if left >= 0 {
            var right: Int = nums.count - 1
            while right > left && nums[left] >= nums[right] {
                right -= 1
            }
            nums.swapAt(left, right)
        }
        
        reverse(&nums, left + 1, nums.count - 1)
        
    }
    
    private func reverse(_ nums: inout [Int], _ left: Int, _ right: Int) {
        var left = left
        var right = right
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}

