    //https://leetcode.cn/problems/minimum-cost-to-convert-string-iii/
struct _StringHasher {
    private let base: UInt64 = 131  // 常用质数基数
    private let mod: UInt64 = 1_000_000_007  // 大质数模数
    private var prefixHash: [UInt64] = []
    private var power: [UInt64] = []
    
    init(_ s: String) {
        let n = s.count
        prefixHash = Array(repeating: 0, count: n + 1)
        power = Array(repeating: 1, count: n + 1)
        
        let chars = Array(s)
        for i in 0..<n {
            let charValue = UInt64(chars[i].asciiValue ?? 0)
            prefixHash[i + 1] = (prefixHash[i] * base + charValue) % mod
            power[i + 1] = (power[i] * base) % mod
        }
    }
    
        /// 获取子串 [l, r] 的哈希值（闭区间，0-based）
    func getHash(_ l: Int, _ r: Int) -> UInt64 {
        guard l <= r, l >= 0, r < prefixHash.count - 1 else { return 0 }
        let hash = (prefixHash[r + 1] + mod - (prefixHash[l] * power[r - l + 1]) % mod) % mod
        return hash
    }
}

    class Solution {
        private let INF = Int.max / 2
        private struct Rule {
            var patternChars: [Character]
            var replacementChars:[Character]
            var cost: Int
            var patternHashValue:UInt64
            var replacementValue:UInt64
            var length:Int
            init(_ pStr:String,_ rStr:String, _ curCost:Int) {
                self.patternChars = [Character](pStr)
                self.replacementChars = [Character](rStr)
                self.cost = curCost
                for ch in patternChars {
                    if ch == "*" {
                        self.cost += 1
                    }
                }
                self.patternHashValue = (curCost == self.cost ? _StringHasher(pStr).getHash(0, pStr.count - 1) : UInt64.max)
                self.replacementValue = _StringHasher(rStr).getHash(0, rStr.count - 1)
                self.length = pStr.count
            }
        }
        func minCost(_ source: String, _ target: String, _ rules: [[String]], _ costs: [Int]) -> Int {
            let sourceChars = [Character](source), M = source.count, sourceHasher = _StringHasher(source)
            let targetChars = [Character](target), N = target.count,targetHasher = _StringHasher(target)
            let newRules = (0..<rules.count).map { i in
                Rule(rules[i][0], rules[i][1], costs[i])
            }


            func checkRange(_ patternChars: [Character], _ curIdx:Int, _ length:Int) -> Bool {
                for delta in 0..<length {
                    guard patternChars[delta] == "*" || patternChars[delta] == sourceChars[curIdx + delta] else {
                        return false
                    }
                }
                return true
            }

            func isMatched(_ curIdx:Int, _ nr:Rule) -> Bool {
                let l = nr.length
                guard curIdx + l - 1 < M && curIdx + l - 1 < N else {
                    return false
                }
                guard targetHasher.getHash(curIdx, curIdx + l - 1) == nr.replacementValue else {
                    return false
                }
                if nr.patternHashValue != UInt64.max {
                    guard sourceHasher.getHash(curIdx, curIdx + l - 1) == nr.patternHashValue else {
                        return false
                    }
                } else {
                    guard checkRange(nr.patternChars, curIdx, l) else {
                        return false
                    }
                }
                return true
            }


            var memo = [Int?](repeating: nil, count: N + 5)

            func dfs(_ curMatchedIdx: Int) -> Int {
                guard curMatchedIdx < N else {return 0}
                if let v = memo[curMatchedIdx] {
                    return v
                }
                var sb = INF
                if sourceChars[curMatchedIdx] == targetChars[curMatchedIdx] {
                    sb = dfs(curMatchedIdx + 1)
                }

                for nr in newRules {
                    let l = nr.length
                    if isMatched(curMatchedIdx, nr) {
                        sb = min(sb,nr.cost + dfs(curMatchedIdx + l))
                    }
                }
                memo[curMatchedIdx] = sb
                return sb
            }
            let sb = dfs(0)
            return sb >= INF ? -1 : sb
        }

    }
