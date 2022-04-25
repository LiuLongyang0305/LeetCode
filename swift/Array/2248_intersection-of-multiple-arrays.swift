 // https://leetcode.com/problems/intersection-of-multiple-arrays/
class Solution {
    func intersection(_ nums: [[Int]]) -> [Int] {
        var counter = [Set<Int>](repeating: [], count: 1005)

        let N = nums.count
        for i in 0..<N{
            for num in nums[i] {
                counter[num].insert(i)
            }
        }


        var ans = [Int]()
        for i in 0..<1005{
            if counter[i].count == N {
                ans.append(i)
            }
        }
        return ans

    }
}