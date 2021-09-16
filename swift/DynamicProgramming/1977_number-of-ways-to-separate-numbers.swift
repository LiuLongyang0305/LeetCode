// https://leetcode.com/problems/number-of-ways-to-separate-numbers/
extension Int {
    static var mod: Int {
        return 1_000_000_007
    }
}
//TLE: 256/257
class Solution1 {
    
    private struct State: Hashable {
        var str:Int
        var curIdx: Int
    }
    func numberOfCombinations(_ num: String) -> Int {
        guard num.first != "0"  else {
            return 0
        }
        let N = num.count
        let chars = [Character](num)
        var memo = [State:Int]()
        
        func helper(_ last: String,_ curIdx: Int) -> Int {
            guard curIdx < N else {
                return 1
            }
            
            guard chars[curIdx] != "0"  && N - curIdx >= last.count else {
                return 0
            }
            let key = State(str: last.hashValue, curIdx: curIdx)
            if let c = memo[key] {
                return c
            }
            
            var ans = 0
            let j = curIdx - 1 + last.count
            
            var cur = j < 0 ? "" : String(chars[curIdx...j])
            if !cur.isEmpty && cur >= last {
                ans = (ans + helper(cur, j + 1)) % Int.mod
            }
            var idx = j + 1
            while idx < N {
                cur.append(chars[idx])
                ans =  (ans + helper(cur, idx + 1)) % Int.mod
                idx += 1
            }
            memo[key] = ans
            return ans % Int.mod
        }
        return helper("", 0)
    }
    
}




class Solution {
    func numberOfCombinations(_ num: String) -> Int {
        guard num.first != "0"  else {
            return 0
        }
        let N = num.count
        guard N > 1 else {
            return 1
        }
        let chars = [Character](num)
        
        var lcp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: N)
        for i in stride(from: N - 1, through: 0, by: -1) {
            lcp[i][N - 1] = (chars[i] == chars[N - 1] ? 1 : 0)
            var j = i + 1
            while j < N - 1 {
                lcp[i][j] = (chars[i] == chars[j] ? (lcp[i + 1][j + 1] + 1) : 0)
                j += 1
            }
        }
        
    
        var memo = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: N)

        func update(_ out: inout Int,_ add: Int) {
            var temp = out + add
            if temp >= Int.mod {
                temp -= Int.mod
            }
            out = temp
        }
        
        for i in 0..<N {
            memo[0][i] = 1
        }
        
        for i in 1..<N {
            guard chars[i] != "0" else {
                continue
            }
            var presum = 0
            for j in i..<N {
                let length = j - i + 1
                memo[i][j] = presum
                if i - length >= 0 {
                    if lcp[i - length][i] >= length || chars[i - length + lcp[i - length][i]] < chars[i + lcp[i - length][i]] {
                        update(&memo[i][j], memo[i - length][i - 1])
                    }
                    update(&presum, memo[i - length][i - 1])
                }
                
            }
        }
        var ans = 0
        for i in 0..<N {
            update(&ans, memo[i][N - 1])
        }
        return ans
    }
}


