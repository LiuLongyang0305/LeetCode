// https://leetcode.com/problems/minimum-absolute-sum-difference/
class Solution {
    private let MOD = 1_000_000_007
    func minAbsoluteSumDiff(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let N = nums1.count
        var noChange = 0
        for i in 0..<N {
            noChange += abs(nums1[i] - nums2[i])
        }
        var ans = noChange
        let sortedNums1 = nums1.sorted()
        
        func searchPosition(for val: Int) -> Int {
            guard val > sortedNums1[0] else {
                return -1
            }
            guard val < sortedNums1[N - 1] else {
                return N
            }
            var left = 0
            var right = N - 1
            while left < right {
                let mid = left + (right - left) >> 1
                if sortedNums1[mid] == val {
                    return mid
                } else if sortedNums1[mid] < val {
                    guard sortedNums1[mid + 1] <= val else {
                        return mid
                    }
                    left = mid + 1
                } else {
                    guard sortedNums1[mid - 1] > val else {
                        return mid - 1
                    }
                    right = mid - 1
                }
            }
            
            return sortedNums1[left] <= val ? left : (left - 1)
        }
        for idx in 0..<N {
            var temp = noChange
            temp -= abs(nums2[idx] - nums1[idx])
            let idx1 = searchPosition(for: nums2[idx])
            if idx1 == -1 {
                temp += abs(sortedNums1[0] - nums2[idx])
            } else if idx1 == N {
                temp += abs(sortedNums1[N - 1] - nums2[idx])
            } else {
                temp += min(abs(sortedNums1[idx1] - nums2[idx]), abs(sortedNums1[idx1 + 1] - nums2[idx]))
            }
            ans = min(ans, temp)
        }
        return ans % MOD
    }
}

