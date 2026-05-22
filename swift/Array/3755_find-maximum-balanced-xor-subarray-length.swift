  //https://leetcode.cn/problems/find-maximum-balanced-xor-subarray-length
    class Solution {
        func maxBalancedSubarray(_ nums: [Int]) -> Int{
            var xorSum = 0
            var oddAndEvenDiff = 0
            let N = nums.count
            var map = [String:Int]()
            var sb = 0
            map["0-0"] = -1
            for i in 0..<N {
                xorSum = xorSum ^ nums[i]
                oddAndEvenDiff += (nums[i] & 1 == 0 ? 1 : -1)
                let key = "\(xorSum)-\(oddAndEvenDiff)"
                if let j = map[key] {
                    sb = max(sb,i - j)
                } else {
                    map[key] = i
                }

            }
            return sb
        }
    }
