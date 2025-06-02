//https://leetcode.com/problems/sliding-subarray-beauty/
class Solution {
    func getSubarrayBeauty(_ nums: [Int], _ p: Int, _ x: Int) -> [Int] {
        var ans = [Int]()
        var counter = [Int](repeating: 0, count: 110)

        var i = 0
        var j = 0
        let N = nums.count
        while i < N {
            let maxJ = i + p
            guard maxJ <= N else {break}
            while j < maxJ {
                counter[nums[j] + 50] += 1
                j += 1
            }
            var pre = 0
            for k in 0...100 {
                if counter[k] != 0 {
                    pre += counter[k]
                    // print()
                    if pre >= x {
                        ans.append(min(k - 50,0))
                        break
                    }
                }
            }
            counter[nums[i] + 50] -= 1
            i += 1

        }
        return ans
    }
}
