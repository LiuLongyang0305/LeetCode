//https://leetcode.com/problems/assign-cookies/
class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let gCopy = g.sorted()
        let sCopy = s.sorted()
        var cookieIndex = 0
        let cookieCount = s.count
        var num = 0
        var isAllCandyUsed = false
        for ele in gCopy {
            if !isAllCandyUsed {
                while cookieIndex < cookieCount && sCopy[cookieIndex] < ele {
                    cookieIndex += 1
                }
                if cookieIndex != cookieCount  {
                    num += 1
                }
                cookieIndex += 1
                if cookieIndex >= cookieCount {
                    isAllCandyUsed = true
                }
            }
        }
        return num
    }
}