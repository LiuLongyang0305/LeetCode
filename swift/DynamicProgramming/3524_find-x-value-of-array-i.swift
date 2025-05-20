// http://leetcode.cn/problems/find-x-value-of-array-i/
class Solution {
    func resultArray(_ nums: [Int], _ k: Int) -> [Int] {
        let numsModK = nums.map { $0 % k}
        var ans = [Int](repeating: 0, count: k)
        var counter = [Int](repeating: 0, count: k)
        for (i,num) in numsModK.enumerated() {
            var new = [Int](repeating: 0, count: k)
            new[num % k ] = 1

            for mod in 0..<k {
                new[mod * num % k] += counter[mod]
            }
            counter = new
            for mod in 0..<k {
                ans[mod] += counter[mod]
            }
        }

        return ans
    }
}