// https://leetcode.com/problems/race-car/
class Solution {
    func unequalTriplets(_ nums: [Int]) -> Int {
        var  cnt = 0
        let N = nums.count
        for i in 0..<N {
            var j = i + 1
            while j < N {
                var k = j + 1
                while k < N {
                    if nums[i] != nums[j] && nums[i] != nums[k] && nums[j] != nums[k] {
                        cnt += 1
                    }
                    k += 1
                }
                j += 1
            }
        }
        return cnt
    }
}