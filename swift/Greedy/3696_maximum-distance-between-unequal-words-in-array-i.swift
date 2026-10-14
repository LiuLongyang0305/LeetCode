//https://leetcode.cn/problems/maximum-distance-between-unequal-words-in-array-i/
class Solution {
func maxDistance(_ words: [String]) -> Int {
    let n = words.count
    if n < 2 { return 0 }
    
    var ans = 0
    
    // 候选1：左端固定为 0
    var j = n - 1
    while j > 0 {
        if words[0] != words[j] {
            ans = max(ans, j - 0 + 1)
            break
        }
        j -= 1
    }
    
    // 候选2：右端固定为 n-1
    var i = 0
    while i < n - 1 {
        if words[i] != words[n - 1] {
            ans = max(ans, (n - 1) - i + 1)
            break
        }
        i += 1
    }
    
    return ans
}
}
