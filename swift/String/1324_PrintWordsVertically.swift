// https://leetcode.com/problems/print-words-vertically/
class Solution {
    func printVertically(_ s: String) -> [String] {
        let compoments = s.split(separator: " ").map {[Character]($0)}
        var maxCount = 0
        for arr in compoments {
            maxCount = max(arr.count, maxCount)
        }
        var ans = Array<String>(repeating: "", count: maxCount)
        for index in 0..<maxCount {
            for chars in compoments {
                ans[index].append(index >= chars.count ? " " : chars[index])
            }
        }
        for i in 0..<maxCount {
            while ans[i].last! == " " {
                ans[i].removeLast()
            }
        }
        return ans
    }
 }