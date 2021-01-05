// https://leetcode.com/problems/ways-to-split-array-into-three-subarrays/
class Solution {
    private let MOD = 1_000_000_007
    func waysToSplit(_ nums: [Int]) -> Int {
        let N = nums.count
        var preffix = [0]
        for num in nums {
            preffix.append(preffix.last! + num)
        }
        var ans = 0
        var midStartIdx = 2
        for l in 1...(N - 2) {
            let leftSum = preffix[l]
            midStartIdx = max(midStartIdx, l + 1)
            while midStartIdx < N && preffix[midStartIdx] - leftSum < leftSum  {
                midStartIdx += 1
            }
            guard midStartIdx < N else {
                break
            }
            var low = midStartIdx
            var high = N - 1
            while low <= high {
                let mid = (low + high) >> 1
                if preffix[N] - preffix[mid] < preffix[mid] - leftSum {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
            ans = (ans + high - midStartIdx + 1) % MOD
        }
        return ans
    }
}

