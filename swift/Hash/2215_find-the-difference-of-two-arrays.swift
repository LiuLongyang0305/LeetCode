// https://leetcode.com/problems/find-the-difference-of-two-arrays/
class Solution1 {
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        let s1 = Set<Int>(nums1)
        let s2 = Set<Int>(nums2)
        return [[Int](s1.subtracting(s2)),[Int](s2.subtracting(s1))]
    }
}
class Solution {
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        var ans = [[Int]](repeating: [], count: 2)
        var map = [Int:Int]()
        nums2.forEach { map[$0,default: 0] |= 2}
        nums1.forEach { map[$0,default: 0] |= 1}
        for (num,flag) in map {
            if 1 == flag  {
                ans[0].append(num)
            }
            if 2 == flag {
                ans[1].append(num)
            }
        }
        return ans
    }
}