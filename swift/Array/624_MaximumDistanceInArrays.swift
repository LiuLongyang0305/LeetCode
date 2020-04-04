// https://leetcode.com/problems/maximum-distance-in-arrays/
class Solution {
    private typealias Info = (val:Int,index:Int)
    func maxDistance(_ arrays: [[Int]]) -> Int {
        var ans = 0
        var minValues = [Info]()
        var maxValues = [Info]()
        for i in 0..<arrays.count {
            minValues.append((arrays[i][0],i))
            maxValues.append((arrays[i].last!,i))
        }
        minValues.sort { (info1, info2) -> Bool in
            info1.val < info2.val
        }
        maxValues.sort { (info1, info2) -> Bool in
            info1.val > info2.val
        }
        for minVal in minValues {
            for maxValue in maxValues {
                if minVal.index != maxValue.index {
                    ans = max(ans, abs(minVal.val - maxValue.val))
                    break
                }
            }
        }
        return ans
    }
}
