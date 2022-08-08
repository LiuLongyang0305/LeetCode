// https://leetcode.com/problems/number-of-arithmetic-triplets/
class Solution {

    func arithmeticTriplets(_ nums: [Int], _ diff: Int) -> Int {
        var ans = 0
        let N = nums.count
        var i = 0
        while i < N {
            var j = i + 1
            while j < N {
                var k = j + 1
                while k < N {
                    if nums[j] - nums[i] == diff && nums[k] - nums[j] == diff {
                        ans += 1
                    }
                    k += 1
                }
                j += 1
            }
            i += 1
        }
        return ans
    }
}
