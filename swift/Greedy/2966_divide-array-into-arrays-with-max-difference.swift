 // https://leetcode.cn/problems/divide-array-into-arrays-with-max-difference/
    class Solution {
        func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {
            let sortedNums = nums.sorted()
            let N = nums.count
            for i in stride(from: 0, to: N, by: 3) {
                guard sortedNums[i + 2] - sortedNums[i] <= k else {return []}
            }
            var ans = [[Int]]()
            for i in stride(from: 0, to: N, by: 3) {
                ans.append([sortedNums[i],sortedNums[i + 1],sortedNums[i + 2]])
            }
            return ans
        }
    }