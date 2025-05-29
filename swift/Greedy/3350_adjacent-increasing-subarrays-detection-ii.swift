//https://leetcode.com/problems/adjacent-increasing-subarrays-detection-ii/

class Solution {

        private typealias Group = (from: Int,  to: Int, Length: Int)
        func maxIncreasingSubarrays(_ nums: [Int]) -> Int {
            guard nums.count > 2 else {return 1}
            let N = nums.count
            let pairs = getIndicePairs(of: nums)
            var ans = max(pairs[0].Length / 2,1)

            if pairs.count > 1 {
                for i in 1..<pairs.count
                {
                    ans = max(ans, pairs[i].Length / 2)
                    if pairs[i].from == pairs[i - 1].to  + 1{
                        ans = max(ans,min(pairs[i].Length,pairs[i - 1].Length))
                    }
                }
            }

            return ans

        }

        private func getIndicePairs(of nums: [Int]) -> [Group]  {
            let N = nums.count
            var ans = [Group]()
            var i = 0
            var j = 1
            while i < N {
                while j < N && nums[j] > nums[j - 1] {
                    j += 1
                }
                ans.append((i, j - 1,j - i))
                i = j
                j += 1
            }
            return ans
        }
    }
