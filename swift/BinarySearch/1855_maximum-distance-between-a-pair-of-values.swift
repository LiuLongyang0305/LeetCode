// https://leetcode.com/problems/maximum-distance-between-a-pair-of-values/
class Solution1 {
    func maxDistance(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var ans = Int.min
        func binarySearch(_ from: Int, _ target: Int) -> Int? {
            guard from < nums2.count else {
                return nil
            }
            guard nums2[from] >= target else {
                return nil
            }
            guard nums2.last! < target else {
                return nums2.count - 1
            }
            var left = from
            var right = nums2.count
            var ans = Int.min
            
            while left < right {
                let mid = (left + right) >> 1
                if nums2[mid] >= target {
                    ans = max(ans, mid)
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            return ans == Int.min ? nil : (nums2[left] >= target ? max(ans, left) : ans)
        }
        for idx in 0..<nums1.count {
            if let idx2 = binarySearch(idx, nums1[idx]) {
                ans = max(ans, idx2 - idx)
            }
        }
        return max(0,ans)
    }
}
class Solution {
    func maxDistance(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let M = nums1.count
        let N = nums2.count
        var i = 0
        var ans = 0
        for j in 0..<N {
            while i < M && nums1[i] > nums2[j] {
                i += 1
            }
            if i < M {
                ans = max(ans, j - i)
            }
        }
        return ans
    }
}

