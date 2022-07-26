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


// https://leetcode.com/problems/find-the-shortest-superstring/
class Solution {
    private typealias Info = (seq:[Int],length: Int)
    func shortestSuperstring(_ words: [String]) -> String {

        let covered = getCovered(of: words)
        let M = words.count
        let maxMask = (1 << M) - 1

        var memo = [[Info]](repeating: [Info](repeating: ([],0), count: M), count: maxMask + 1)

        for i in 0..<M {
            memo[1 << i][i] = ([i],words[i].count)
        }

        for mask in 1...maxMask {
            for last in 0..<M {
                guard mask & (1 << last) != 0 else {continue}
                for cur in 0..<M {
                    let newLength = memo[mask][last].length + words[cur].count - covered[last][cur]
                    let old = memo[mask | (1 << cur)][cur]
                    if old.length == 0 || old.length > newLength {
                        memo[mask | (1 << cur)][cur] = (memo[mask][last].seq + [cur],newLength)
                    }
                }
            }
        }
        var info:Info = ([],Int.max)
        for i in 0..<M {
            if memo[maxMask][i].length < info.length {
                info = memo[maxMask][i]
            }
        }
        var ans = ""
        var last = -1
        for num in info.seq {
            ans += -1 == last ? words[num] : String(words[num].dropFirst(covered[last][num]))
            last = num
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

