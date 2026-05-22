// https://leetcode.cn/problems/twisted-mirror-path-count/
class Solution {
    private let  MOD = 1_000_000_007
    func uniquePaths(_ grid: [[Int]]) -> Int {

        let M = grid.count - 1
        let N = grid[0].count - 1

        var memo = [String:Int]()

        func dfs(_ r: Int, _ c: Int, _ direction: Character) -> Int {

            if r == M && c ==  N {return 1}
            if r > M || c > N {return 0}
            let key = "\(r)_\(c)_\(direction)"
            if let sb = memo[key] {return sb}

            var sb = 0
            if grid[r][c] == 0 {
                sb = (dfs(r + 1,c,"d") + dfs(r, c + 1,"r")) % MOD
            } else {

                if direction == "d" {
                    sb = dfs(r, c + 1,"r")  % MOD
                }

                if direction == "r" {
                    sb = dfs(r + 1,c,"d") % MOD
                }
            }
            memo[key] = sb
            return sb
        }

        return  dfs(0,0," ")
    }
}
