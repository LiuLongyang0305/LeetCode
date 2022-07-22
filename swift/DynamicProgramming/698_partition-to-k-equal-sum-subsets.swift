// https://leetcode.com/problems/partition-to-k-equal-sum-subsets/
class Solution {
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {

        let N = nums.count
        let total = nums.reduce(0) { $0 + $1}
        guard total % k == 0 else {return false}
        let target = total / k
        var possibleMask = Set<Int>()
        let maxMask = (1 << N) - 1
        for mask in 1...maxMask {
            var sum = 0
            for i in 0..<N {
                if mask & (1 << i) != 0 {
                    sum += nums[i]
                }
            }
            if sum == target {
                possibleMask.insert(mask)
            }
        }

        guard !possibleMask.isEmpty else {
            return false
        }

        var memo = [Bool?](repeating: nil, count: maxMask + 5)


        func  dfs(_ mask: Int) -> Bool {

            if let v = memo[mask] {
                return v
            }
            let remainMask = mask ^ maxMask
            guard !possibleMask.contains(remainMask) else {return true}
            var ans = false
            var subSet = (remainMask - 1) & remainMask
            while subSet != remainMask {
                if possibleMask.contains(subSet) {
                    let t = dfs(subSet | mask)
                    guard !t else {
                        ans = true
                        break
                    }
                }
                subSet = (subSet - 1) & remainMask
            }
            memo[mask] = ans
            return ans
        }
        return dfs(0)
    }
}

