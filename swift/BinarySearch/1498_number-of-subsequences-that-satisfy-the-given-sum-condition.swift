// https://leetcode.com/problems/number-of-subsequences-that-satisfy-the-given-sum-condition/
class Solution {
    private let MOD = 1_000_000_007
    private var memo: [Int: Int] = [0:1]
    func numSubseq(_ nums: [Int], _ target: Int) -> Int {
        var ans = 0
        let sortedNumbers = nums.sorted()
        let N = sortedNumbers.count
        
        func binarySearch(_ target: Int) -> Int? {
            
            guard sortedNumbers[0] <= target else {
                return nil
            }
            guard sortedNumbers[N - 1] > target else {
                return N - 1
            }
            var left = 0
            var right = N - 1
            while left < right {
                let mid = left + (right - left) >> 1
                if sortedNumbers[mid] > target {
                    right = mid - 1
                } else {
                    if mid == N - 1 || sortedNumbers[mid + 1] > target {
                        return mid
                    }
                    left = mid + 1
                }
            }
            return left
        }
        // 枚举最小值
        for i in 0..<N {
            if let index = binarySearch(target - sortedNumbers[i]) {
                guard index >= i else {
                    continue
                }
                ans += power(index - i )
                ans %= MOD
            }
        }
        return ans
    }
    
    private func power(_ time: Int) -> Int {
        if let cnt = memo[time] {
            return cnt
        }
        var ans = power(time >> 1) % MOD
        ans *= ans
        ans %= MOD
        if time % 2 == 1 {
            ans *= 2
        }
        ans %= MOD
        memo[time] = ans
        return ans
    }
}

