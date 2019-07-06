class Q14_Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count < 2 {
            return strs.count == 0 ? "" : strs[0]
        }
        var result : String = commonPrefixOfTwoString(s1: strs[0], s2: strs[1])
        if result != "" {
            for i in 2..<strs.count {
                result = commonPrefixOfTwoString(s1: result, s2: strs[i])
                if result == "" {
                    break
                }
            }
        }
        return result
    }
    private func commonPrefixOfTwoString(s1: String,s2: String) -> String {
        if s1.count == 0 || s2.count == 0 {
            return ""
        }
        var result = ""
        var index1 = s1.startIndex
        var index2 = s2.startIndex
        while index1 < s1.endIndex && index2 < s2.endIndex  && s1[index1] == s2[index2]{
            result.append(s1[index1])
            index2 = s2.index(after: index2)
            index1 = s1.index(after: index1)
        }
        return result
    }
}