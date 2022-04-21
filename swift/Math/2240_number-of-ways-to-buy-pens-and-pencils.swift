// https://leetcode.com/problems/number-of-ways-to-buy-pens-and-pencils/
class Solution {
    func waysToBuyPensPencils(_ total: Int, _ cost1: Int, _ cost2: Int) -> Int {

        var ans = 0
        var penCnt = 0
        
        while penCnt * cost1 <= total {
            ans += (total - penCnt * cost1) / cost2 + 1
            penCnt += 1
        }
        return ans
    }
}