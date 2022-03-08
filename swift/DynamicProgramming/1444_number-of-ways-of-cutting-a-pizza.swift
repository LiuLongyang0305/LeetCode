// https://leetcode.com/problems/number-of-ways-of-cutting-a-pizza/
class Solution {
    private let MOD = 1_000_000_007
    func ways(_ pizza: [String], _ k: Int) -> Int {
        
        let M = pizza.count
        let N = pizza[0].count
        
        let martrix = pizza.map { row in
            row.map { $0 == "A"}
        }
        
        var memo = [Int:Int]()
        
        
        func check(_ r: Int, _ c: Int) -> Bool {
            var ans = false
            var i = r
            while i < M {
                var j = c
                while j < N {
                    ans = ans || martrix[i][j]
                    j += 1
                }
                i += 1
            }
            return ans
        }
        
        
        
        func dfs(_ startRow: Int,_ startCol: Int, _ slices: Int) -> Int {
            
            guard slices > 1 else {
                return check(startRow, startCol) ? 1 : 0
            }
            let key = (startRow << 20) | (startCol << 10) | slices
            guard nil == memo[key] else {return memo[key]!}
            var ans = 0
            //horizon
            
            var r = startRow
            var flag = false
            while r < M {
                
                var c = startCol
                while c < N {
                    flag = flag || martrix[r][c]
                    c += 1
                }
                
                if flag {
                    ans += dfs(r + 1, startCol, slices - 1)
                    ans %= MOD
                }
                
                
                r += 1
            }
            
            //vertical
            
            var c = startCol
            flag = false
            while c < N {
                var r = startRow
                while r < M {
                    flag = flag || martrix[r][c]
                    r += 1
                }
                if flag {
                    ans += dfs(startRow, c + 1, slices - 1)
                    ans %= MOD
                }
                c += 1
            }
            memo[key] = ans
            return ans
        }
        return dfs(0,0, k)
    }
}
