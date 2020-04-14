// https://leetcode.com/problems/palindrome-permutation-ii/
class Solution {
    func generatePalindromes(_ s: String) -> [String] {
        var ans = Set<String>()
        var targetStr = [Character]()
        var counter = [Character: Bool]()
        for ch in s {
            counter.updateValue(!(counter[ch] ?? true), forKey: ch)
            if let flag = counter[ch] {
                if flag {
                    targetStr.append(ch)
                }
            }
        }
        guard counter.count != 1 else {
            return [s]
        }

        var cnt = 0
        var ch = ""
        
        for (key,val) in counter {
            if !val {
                cnt += 1
                ch.append(key)
                if cnt > 1 {
                    return []
                }
            }
        }
        var visited = Array<Bool>(repeating: false, count: targetStr.count)
        let length = targetStr.count
        func backtracking( _ currentStr: String) {
            guard currentStr.count < length  else {
                ans.insert(currentStr + ch + String(currentStr.reversed()))
                return
            }
            for i in 0..<length {
                if !visited[i] {
                    visited[i] = true
                    backtracking(currentStr + "\(targetStr[i])")
                    visited[i] = false
                }
            }
        }
        backtracking("")
        return [String](ans)
    }
}
