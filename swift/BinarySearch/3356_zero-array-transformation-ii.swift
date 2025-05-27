    //https://leetcode.cn/problems/zero-array-transformation-ii
class Solution {
    func minZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Int {

        let M = nums.count
        func check(_ queriesCnt: Int) -> Bool {

            var diff = [Int](repeating: 0, count: M + 1)
            for i in 0..<queriesCnt {
                diff[queries[i][0]] += queries[i][2]
                diff[queries[i][1] + 1] -= queries[i][2]

            }
            if queriesCnt == 4 {
                print(diff)
            }
            var curDiffSum = 0
            for i in 0..<M {
                curDiffSum += diff[i]
                if nums[i] > curDiffSum {
                    return false
                }
            }

            return true
        }
        if nums.min() ?? 0 == 0 && nums.max() ?? 0 == 0  {return 0}
        let N = queries.count
        if !check(N) {return -1}
        var l = 0
        var r = N
        while l < r {
            let mid = (l + r ) >> 1
            if check(mid) {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l > N ? -1 : (check(l) ? l : (l + 1))
    }


}
