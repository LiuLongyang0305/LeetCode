//https://leetcode.cn/problems/lexicographically-minimum-string-after-removing-stars/
class Solution {
    func clearStars(_ s: String) -> String {
        let sChars = [Character](s)
        var removed = Set<Int>()
        var stacks = [[Int]](repeating: [], count: 26)
        for i in 0..<s.count {
            if sChars[i] == "*" {
                if let idx = stacks.firstIndex(where: { !$0.isEmpty }) {
                    removed.insert(stacks[idx].removeLast())
                }
                removed.insert(i)
            } else {
                stacks[sChars[i].numVal].append(i)
            }
        }
        var ans = ""
        for i in 0..<s.count {
            if !removed.contains(i) {
                ans.append("\(sChars[i])")
            }
        }
        return ans
    }
}
extension Character {
    var numVal: Int {
        return Int(self.asciiValue! - 97)
    }
}