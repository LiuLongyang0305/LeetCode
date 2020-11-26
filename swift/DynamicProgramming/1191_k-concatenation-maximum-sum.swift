// https://leetcode.com/problems/k-concatenation-maximum-sum/
class Solution {
    func kConcatenationMaxSum(_ arr: [Int], _ k: Int) -> Int {
        let total = arr.reduce(0) {$0 + $1}
        guard total > 0 else {
            return max(0,maxSubArraySum(arr + arr)) % 1_000_000_007
        }
        guard k > 1 else {
            return maxSubArraySum(arr) % 1_000_000_007
        }
        guard k > 2 else {
            return maxSubArraySum(arr + arr) % 1_000_000_007
        }
        let newArr = arr + arr
        let N = arr.count
        let ans = maxSubArraySum(newArr)
        var minPreSum = 0
        var maxPreSum = Int.min
        var preSum = 0
        for idx in 0..<(N << 1){
            preSum += newArr[idx]
            if idx <= N - 1 {
                minPreSum = min(minPreSum, preSum)
            } else {
                maxPreSum = max(maxPreSum, preSum)
            }
        }
        return max(ans, maxPreSum - minPreSum + (k - 2) * total) % 1_000_000_007
    }
    private func maxSubArraySum(_ arr: [Int]) -> Int {
        var ans = Int.min
        var last = 0
        for num in arr {
            let sum = max(last + num, num)
            if sum > ans {
                ans = sum
            }
            last = sum
        }
        return ans 
    }
}


