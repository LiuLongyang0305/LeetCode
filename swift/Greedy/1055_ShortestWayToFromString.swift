// https://leetcode.com/problems/shortest-way-to-form-string/
class Solution {
    func shortestWay(_ source: String, _ target: String) -> Int {
        let sourceChars = [Character](source)
        let targetChars = [Character](target)
        func update(_ from: Int) -> Int {
            var j = 0
            var i = from
            while j < source.count && i < target.count {
                if sourceChars[j] == targetChars[i] {
                    i += 1
                    j += 1
                } else {
                    j += 1
                }
            }
            return i
        }
        var i = 0
        var ans = 0
        while i < target.count {
            ans += 1
            let index = update(i)
            guard index != i else {
                return -1
            }
            i = index
        }
        return ans
    }
}
