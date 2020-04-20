// https://leetcode.com/problems/the-k-th-lexicographical-string-of-all-happy-strings-of-length-n/
class Solution {
    func getHappyString(_ n: Int, _ k: Int) -> String {
        var happyStrings = [String]()
        func dfs(_ str: String) {
            guard str.count < n else {
                happyStrings.append(str)
                return
            }
            for ch in "abc" {
                if let last = str.last {
                    if ch != last {
                        dfs(str + "\(ch)")
                    }
                } else {
                    dfs("\(ch)")
                }
            }
        }
        dfs("")
        guard happyStrings.count >= k else {
            return ""
        }
        happyStrings.sort()
        return happyStrings[k - 1]
    }
}

