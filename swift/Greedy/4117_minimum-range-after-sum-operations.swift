    // https://leetcode.cn/problems/minimum-range-after-sum-operations/
    class Solution {
        func minRange(_ a: Int, _ b: Int, _ c: Int) -> Int {
            let maxEle = max(a,b,c)
            let minEle = min(a,b,c)
            let mid = a + b + c - maxEle - minEle
            return min(maxEle - minEle,mid)
        }
    }
