//https://leetcode.com/problems/find-the-number-of-good-pairs-ii/
class Solution {
    func numberOfPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {

        let c1 = getCounter(of: nums1)
        let nums1Max = c1.keys.max()!
        let c2 = getCounter(of: nums2)
        var ans = 0
        for (num,cnt) in c2 {
            let start = num * k
            for newNum in stride(from: start, through: nums1Max, by: start) {
                if let c = c1[newNum] {
                    ans += cnt * c
                }
            }
        }
        return ans
    }
    private func getCounter(of nums: [Int]) -> [Int:Int] {
        var ans = [Int:Int]()
        for num in nums {
            ans[num,default: 0] += 1
        }
        return ans
    }
}
