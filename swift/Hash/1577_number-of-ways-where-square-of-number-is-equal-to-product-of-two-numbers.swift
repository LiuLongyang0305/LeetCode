// https://leetcode.com/problems/number-of-ways-where-square-of-number-is-equal-to-product-of-two-numbers/
class Solution {
    func numTriplets(_ nums1: [Int], _ nums2: [Int]) -> Int {
        func count(_ numsCopy1: [Int], _ numsCopy2: [Int]) -> Int {
            guard numsCopy1.count >= 2 else {
                return 0
            }
            var cnt = 0
            var map = [Int:Int]()
            let M = numsCopy1.count
            for i in 0..<(M - 1) {
                for j in (i + 1)..<M {
                    map[numsCopy1[i] * numsCopy1[j], default: 0 ] += 1
                }
            }
            for num in numsCopy2 {
                if let c = map[num * num] {
                    cnt += c
                }
            }
            return cnt
        }

        return count(nums1, nums2) + count(nums2, nums1)
    }
}

