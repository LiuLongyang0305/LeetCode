//https://leetcode.com/problems/max-chunks-to-make-sorted/
class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        var ans = 0
        var maxEle = 0
        for i in 0..<arr.count {
            maxEle =  max(maxEle, arr[i])
            if maxEle ==  i {
                ans += 1
            }
        }
        return ans
    }
}