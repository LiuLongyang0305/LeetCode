// https://leetcode.com/problems/adding-spaces-to-a-string/
class Solution {
    func addSpaces(_ s: String, _ spaces: [Int]) -> String {
        var ans = ""
        var sCopy = s
        var last = 0
        for space in spaces {
            let l = space - last
            let cur = sCopy.prefix(l)
            ans.append(cur + " ")
            last = space
            sCopy.removeFirst(l)
        }
        if !sCopy.isEmpty {
            ans += sCopy
        }
        return ans
    }
}