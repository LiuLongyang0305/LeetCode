//https://leetcode.com/problems/maximum-of-absolute-value-expression/
class Solution {
    func maxAbsValExpr(_ arr1: [Int], _ arr2: [Int]) -> Int {
//        A = arr1[i] + arr2[i] + i
//        B = arr1[i] + arr2[i] - i
//        C = arr1[i] - arr2[i] + i
//        D = arr1[i] - arr2[i] - i
        var AMax = Int.min
        var AMin = Int.max
        var BMax = Int.min
        var BMin = Int.max
        var CMax = Int.min
        var CMin = Int.max
        var DMax = Int.min
        var DMin = Int.max
        
        for i in 0..<arr1.count {
            AMax = max(AMax, arr1[i] + arr2[i] +  i)
            AMin = min(AMin, arr1[i] + arr2[i] +  i)
            BMax = max(BMax, arr1[i] + arr2[i] -  i)
            BMin = min(BMin, arr1[i] + arr2[i] -  i)
            CMax = max(CMax, arr1[i] - arr2[i] +  i)
            CMin = min(CMin, arr1[i] - arr2[i] +  i)
            DMax = max(DMax, arr1[i] - arr2[i] -  i)
            DMin = min(DMin, arr1[i] - arr2[i] -  i)
        }
        return max(AMax - AMin, BMax - BMin, CMax - CMin, DMax - DMin)
    }
}