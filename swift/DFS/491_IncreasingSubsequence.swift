// https://leetcode.com/problems/increasing-subsequences/
 class Solution {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 1 else {
            return []
        }
        var ans = Set<[Int]>()
        let N = nums.count
        func dfs(sequence: inout [Int], currentIndex: Int) {
            guard currentIndex < N else {
                return
            }
            if sequence.count >  1 {
                ans.insert(sequence)
            }
            for index in (currentIndex + 1)..<N {
                if nums[index]  >= sequence.last! {
                    sequence.append(nums[index])
                    dfs(sequence: &sequence,currentIndex:index)
                    sequence.removeLast()
                }
            }
        }

        for index in 0..<(N - 1) {
            var sequence = [nums[index]]
            dfs(sequence: &sequence, currentIndex: index)
        }
        return Array<[Int]>(ans)
    }
 }
Solution().findSubsequences([1,2,3,4,5,6,7,8,9,10,1,1,1,1,1])
