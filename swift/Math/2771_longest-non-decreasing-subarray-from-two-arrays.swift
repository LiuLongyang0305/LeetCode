//https://leetcode.com/problems/longest-non-decreasing-subarray-from-two-arrays/
class Solution {
    func maxNonDecreasingLength(_ nums1: [Int], _ nums2: [Int]) -> Int {


        let N = nums1.count
        guard N > 1 else {return 1}
        var counter = [Int:Int]()
        counter[nums1[0]] = 1
        counter[nums2[0]] = 1

        var ans = 1
        for i in 1..<N {

            var newCounter = [Int:Int]()
            newCounter[nums1[i]] = 1
            newCounter[nums2[i]] = 1

            for (lv,cnt) in counter {
                if nums1[i] >= lv {
                    newCounter[nums1[i]] = max(newCounter[nums1[i]] ?? 1 , cnt + 1)
                }
                if nums2[i] >= lv {
                    newCounter[nums2[i]] = max(newCounter[nums2[i]] ?? 1 , cnt + 1)
                }
                ans = max(ans,newCounter[nums1[i]] ?? 1 , newCounter[nums2[i]] ?? 1)
            }

            counter = newCounter
        }
        return ans
    }
}
