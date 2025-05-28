//https://leetcode.com/problems/find-the-integer-added-to-array-ii/
class Solution {
    func minimumAddedInteger(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let nums1Counter = getCounter(of: nums1)
        let nums2Counter = getCounter(of: nums2)
        let minVal1 = nums1.min()!, maxVal1 = nums1.max()!, minVal2 = nums2.min()!

        func check(_ delta: Int) -> Bool {
            var diff = 0

            for (v,c) in nums2Counter {
                let newVal = v + delta
                guard let c1 = nums1Counter[newVal], c1 >= c else {
                    return false
                }
                diff += c1 - c
                guard diff <= 2 else {
                    return false
                }
            }


            return true
        }


        for delta in stride(from: maxVal1 - minVal2, through: minVal1 - minVal2, by: -1) {
            if check(delta) {
                return -delta
            }
        }
        return 0
    }
    private func getCounter(of nums: [Int]) -> [Int:Int] {
        var ans = [Int:Int]()
        for num in nums {
            ans[num,default:0] += 1
        }
        return ans
    }
}
