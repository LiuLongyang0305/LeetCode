// https://leetcode.com/problems/product-of-two-run-length-encoded-arrays/
class Solution {
    func findRLEArray(_ encoded1: [[Int]], _ encoded2: [[Int]]) -> [[Int]] {
        var ans = [[Int]]()
        var i = 0
        var j = 0
        var remain1 = 0
        var remain2 = 0
        while i < encoded1.count {
            if remain1 == 0 {
                remain1 = encoded1[i][1]
            }
            if remain2 == 0 {
                remain2 = encoded2[j][1]
            }
            let minCnt = min(remain1, remain2)
            let pro = encoded1[i][0] * encoded2[j][0]
            if pro == (ans.last?[0] ?? -1) {
                ans[ans.count - 1][1] += minCnt
            } else {
                ans.append([pro,minCnt])
            }
            remain1 -= minCnt
            remain2 -= minCnt
            if remain1 == 0 {
                i += 1
            }
            if remain2 == 0 {
                j += 1
            }
        }
        return ans
    }
}