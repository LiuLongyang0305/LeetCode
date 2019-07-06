//https://leetcode.com/problems/excel-sheet-column-title/
class Solution {
    func convertToTitle(_ n: Int) -> String {
        let map = Array<Character>("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var ans = ""
        var temp = n
        while temp > 0 {
            temp -= 1
            var index = temp % 26
            ans.insert(map[index], at: ans.startIndex)
            temp /= 26
        }
        return ans
    }
}

Solution().convertToTitle(52)