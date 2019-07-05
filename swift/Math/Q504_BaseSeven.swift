//https://leetcode.com/problems/base-7/
class Solution {
    func convertToBase7(_ num: Int) -> String {
        var ans = ""
        var numCopy = num
        var startIndex = ans.startIndex
        if numCopy < 0 {
            numCopy = -numCopy
            ans.append("-")
            startIndex = ans.index(after: ans.startIndex)
        }
        guard numCopy >= 7 else {
            return ans.appending( "\(numCopy)")
        }
        while numCopy > 0 {
            ans.insert(Character("\(numCopy % 7)"), at: startIndex)
            numCopy /= 7
        }
        return ans
    }
}

Solution().convertToBase7(-7)