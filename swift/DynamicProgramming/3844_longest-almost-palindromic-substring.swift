// https://leetcode.cn/problems/longest-almost-palindromic-substring/
class Solution {
    func almostPalindromic(_ s: String) -> Int {
    let chars = Array(s)
    let N = chars.count
    guard N > 2 else { return N }
    
    // 使用两个二维布尔数组
    var strict = [[Bool]](repeating: [Bool](repeating: false, count: N+2), count: N+2)
    var almost = [[Bool]](repeating: [Bool](repeating: false, count: N+2), count: N+2)
    
    // 单字符
    for i in 0..<N {
        strict[i][i] = true
        almost[i][i] = true
    }
    // 两个字符
    for i in 0..<N-1 {
        strict[i][i+1] = chars[i] == chars[i+1]
        almost[i][i+1] = true // 两个字符总是几乎回文？因为允许删除一个字符变成单字符回文。
    }
    
    var maxLen = 2 // 至少有两个字符的几乎回文存在（因为任何两个字符都是几乎回文）
    for len in 3...N {
        var i = 0
        var j = len - 1
        while j < N {
            strict[i][j] = strict[i+1][j-1] && chars[i] == chars[j]
            almost[i][j] = (almost[i+1][j-1] && chars[i] == chars[j]) || strict[i+1][j] || strict[i][j-1]
            if almost[i][j] {
                maxLen = max(maxLen, j - i + 1)
            }
            
            i += 1
            j += 1
        }
    }
    return maxLen
}
}
