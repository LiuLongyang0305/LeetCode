// https://leetcode.com/problems/check-if-there-is-a-valid-partition-for-the-array/
class Solution {
    func validPartition(_ nums: [Int]) -> Bool {
        let N = nums.count

        var memo = [Bool?](repeating: nil, count: N)

        func dfs(_ idx: Int) -> Bool {

            guard idx < N else {return true}
            if let v = memo[idx] {
                return v
            }

            var ans = false
            if idx + 1 < N {
                if nums[idx] == nums[idx + 1] {
                    ans = ans || dfs(idx + 2)
                }
            }
            if !ans {
                if idx + 2 < N {
                    if nums[idx] == nums[idx + 1] && nums[idx + 1] == nums[idx + 2] {
                        ans = ans || dfs(idx + 3)
                    }
                    if !ans {
                        if nums[idx + 1] - nums[idx] == 1 && nums[idx + 2] - nums[idx + 1] == 1 {
                            ans = ans || dfs(idx + 3)
                        }
                    }
                }

            }
            memo[idx] = ans
            return ans

        }
        return dfs(0)
    }
}