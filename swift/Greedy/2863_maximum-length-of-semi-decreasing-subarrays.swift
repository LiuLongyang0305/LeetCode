    // https://leetcode.cn/problems/maximum-length-of-semi-decreasing-subarrays/
    class Solution {
        func maxSubarrayLength(_ nums: [Int]) -> Int {
            let M = nums.count

            guard M >= 2 else {return 0}
            var suffixMaxVal = nums

            for i in stride(from: M - 2, through: 0, by: -1){
                if nums[i] > suffixMaxVal[i + 1] {
                    suffixMaxVal[i] = suffixMaxVal[i + 1]
                }
            }

            func binarySearchLastSmallerThan(_ left:Int, _ target: Int) -> Int? {
                guard suffixMaxVal[left] < target else {
                    return nil
                }
                if suffixMaxVal[M - 1] < target {
                    return M - 1
                }
                var l = left
                var r = M - 1
                while l < r {
                    let mid = (l + r + 1) / 2
                    if suffixMaxVal[mid] >= target {
                        r = mid - 1
                    } else {
                        l = mid
                    }
                }
                return l
            }




            var ans = 0

            for (i,v) in nums.enumerated() {
                guard let idx = binarySearchLastSmallerThan(i, v) else {
                    continue
                }
                ans = max(ans,idx - i + 1)
            }


            return ans
        }
    }
