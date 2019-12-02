//https://leetcode.com/problems/license-key-formatting/submissions/
class Solution {
     func licenseKeyFormatting(_ S: String, _ K: Int) -> String {
        let chars = [Character](S.uppercased()).filter{$0 != "-"}
        guard !chars.isEmpty else {
            return ""
        }
        guard chars.count > K else {
            return String(chars)
        }
        guard K != 1 else {
            var ans = chars.reduce("") { $0  + "-\($1)"}
            ans.removeFirst()
            return ans
        }
        var ans = ""
        var startIndex  = chars.count % K
        if startIndex != 0 {
            ans += "\(String(chars[0..<startIndex]))-"
        }
        while startIndex < chars.count {
            ans += "\(String(chars[startIndex..<(startIndex + K)]))-"
            startIndex += K
        }
        ans.removeLast()
        return ans
     }
 }