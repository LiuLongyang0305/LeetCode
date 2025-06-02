//https://leetcode.cn/problems/maximum-number-of-alloys/
class Solution {
    func maxNumberOfAlloys(_ n: Int, _ k: Int, _ budget: Int, _ composition: [[Int]], _ stock: [Int], _ cost: [Int]) -> Int {


        func check(_ cnt: Int) -> Bool {


            for i in 0..<k {
                var spend = 0
                for j in 0..<n {
                    spend += max(composition[i][j] * cnt - stock[j], 0) * cost[j]
                }
                if spend <= budget {
                    return true
                }
            }
            return false
        }




        var left = 1
        var right = 2_000_000_00
        var ans = 0
        while left <= right {
            let mid = (left + right) >> 1
            if check(mid) {
                ans = max(ans,mid)
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return ans
    }
}
