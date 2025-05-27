// https://leetcode.com/problems/sum-of-digit-differences-of-all-pairs/
class Solution {
    func sumDigitDifferences(_ nums: [Int]) -> Int {
        var counter = [Int:[Int]]()
        let N = "\(nums[0])".count
        for i in 0..<N {
            counter[i] = [Int](repeating: 0, count: 10)
        }
        let M = nums.count
        for var num in nums {
            for i in 0..<N {
                counter[i]?[num % 10] += 1
                num /= 10
            }

        }

        var ans = 0

        for (_,digitsCounter) in counter {

            for num in digitsCounter {
                ans += (M - num) * num
            }
        }

        return  ans / 2
    }
}
