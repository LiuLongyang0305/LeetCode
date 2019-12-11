// https://leetcode.com/problems/word-break/
 class Solution1 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var queue = [String]()
        let dic = Set<String>(wordDict)
        var visited = Set<String>()
        for word in dic {
            if s.hasPrefix(word) {
                var temp = s
                temp.removeFirst(word.count)
                guard !temp.isEmpty else {
                    return true
                }
                visited.insert(temp)
                queue.append(temp)
            }
        }
        while !queue.isEmpty {
            let length = queue.count
            for _ in 0..<length {
                let str = queue.removeFirst()
                for word in dic {
                    if str.hasPrefix(word) {
                        var next = str
                        next.removeFirst(word.count)
                        guard !next.isEmpty else {
                            return true
                        }
                        if !visited.contains(next) {
                            visited.insert(next)
                            queue.append(next)
                        }
                    }
                }
            }
        }
        return false
    }
 }
 
 class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let dic = Set<String>(wordDict)
        var dp = Array<Bool>(repeating: false, count: s.count + 1)
        dp[0] = true
        let chars  = [Character](s)
        for i in 1...s.count {
            for j in 0..<i {
                if dp[j] && dic.contains(String(chars[j..<i])){
                    dp[i] = true
                    break
                }
            }
        }
        return dp.last!
    }
 }
 