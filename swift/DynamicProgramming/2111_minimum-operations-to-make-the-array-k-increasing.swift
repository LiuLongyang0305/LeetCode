// https://leetcode.com/problems/minimum-operations-to-make-the-array-k-increasing/
class Solution {
    func kIncreasing(_ arr: [Int], _ k: Int) -> Int {
        let N = arr.count
        var ans = 0
        for start in 0..<k {
            var cur = [Int]()
            for idx in stride(from: start, to: N, by: k) {
                cur.append(arr[idx])
            }
            ans += cur.count - lengthOfLIS(cur)
        }
        return ans
    }
    private func lengthOfLIS(_ nums: [Int]) -> Int {
            let N = nums.count
            guard N > 1 else {
                return nums.isEmpty ? 0 : 1
            }
            var length = 1
            var d = Array<Int>(repeating: 0, count: N + 1)
            d[length] = nums[0]
            for idx in 1..<N {
                guard nums[idx] < d[length] else {
                    length += 1
                    d[length] = nums[idx]
                    continue
                }
                var left = 1
                var right = length
                var pos = 0
                while left <= right {
                    let mid = (left + right) >> 1
                    if d[mid] <= nums[idx] {
                        pos = mid
                        left = mid + 1
                    } else {
                        right = mid - 1
                    }
                }
                d[pos + 1] = nums[idx]
            }
            return length
        }
}