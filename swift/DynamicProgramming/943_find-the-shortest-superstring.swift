// https://leetcode.com/problems/find-the-shortest-superstring/
class Solution {
    func shortestSuperstring(_ words: [String]) -> String {
        
        let N = words.count
        var dp = Array<Array<String>>(repeating: Array<String>(repeating: "", count: N), count: 1 << N)
        var ans = words.reduce("") { $0 + $1}
        let covered = getCovered(of: words)
        (0..<N).forEach { dp[1 << $0][$0] = words[$0]}
        
        for mask in 0..<(1 << N) {
            for last in 0..<N {
                guard !dp[mask][last].isEmpty else {
                    continue
                }
                for newEnd in 0..<N {
                    if(mask & (1 << newEnd) == 0) {
                        let newMask = mask | (1 << newEnd)
                        let newstr = dp[mask][last] + (covered[last][newEnd] == 0 ? words[newEnd] : String(words[newEnd].dropFirst(covered[last][newEnd])))
                        if dp[newMask][newEnd].isEmpty ||  newstr.count < dp[newMask][newEnd].count {
                            dp[newMask][newEnd] = newstr
                        }
                    }
                }
            }
        }
        
        
        for str in dp[(1 << N) - 1] {
            if str.count < ans.count {
                ans = str
            }
        }
        
        
        return ans
    }
    
    private func getCovered(of words: [String]) -> [[Int]] {
        let N = words.count
        var covered = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
        for i in 0..<N {
            for j in 0..<N {
                
                var length = min(words[i].count, words[j].count)
                while length >= 0  && words[i].suffix(length) != words[j].prefix(length){
                    length -= 1
                }
                covered[i][j] = length
            }
        }
        return covered
    }
}


