//https://leetcode.cn/problems/minimum-number-of-string-groups-through-transformations/
class Solution {
    func minimumGroups(_ words: [String]) -> Int {
        var set = Set<Int>()
        for word in words {
            set.insert(solve(word))
        }
        return set.count
    }

    private func solve(_ str: String) -> Int {
        let chars = [Character](str)
        var odd = ""
        var even = ""
        for i in 0..<chars.count {
            if i & 1 == 0 {
                even.append(chars[i])
            } else {
                odd.append(chars[i])
            }
        }

        let oddStr = getMinRotateStr(odd)
        let evenStr = getMinRotateStr(even)

        return "\(oddStr)-\(evenStr)".hashValue
    }

    private func getMinRotateStr(_ str: String) -> String {
        guard str.count > 1 else {return str}
        let minChar = str.min()!
        let maxChar = str.max()!
        guard minChar < maxChar else {return str}
        var sb = str
        var idx = str.startIndex
        while idx < str.endIndex {
            if str[idx] == minChar {
                sb = min(sb,String(str[idx...]) + String(str[..<idx]))
            }
            idx = str.index(after: idx)
        }
        return sb
    }
}
