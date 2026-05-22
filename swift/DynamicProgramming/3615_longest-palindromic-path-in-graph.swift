// https://leetcode.com/problems/longest-palindromic-path-in-graph/
class Solution {
    func maxLen(_ n: Int, _ edges: [[Int]], _ label: String) -> Int {

        //统计相同label的节点序号
        let newLabel = label.map { Int($0.asciiValue!) - 97}
        var counter = [[Int]](repeating: [], count: 26)
        for (i,v) in newLabel.enumerated() {
            counter[v].append(i)
        }


        //建图
        var g = [Set<Int>](repeating: [], count: n)
        for e in edges {
            g[e[0]].insert(e[1])
            g[e[1]].insert(e[0])
        }

        //记忆化搜索
        var memo = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 1 << n), count: n + 2), count: n + 2)

        func dfs(_ left: Int, _ right: Int, _ visted: Int) -> Int {
            if -1 != memo[left][right][visted] {
                return memo[left][right][visted]
            }
            var sb = 0
            for x in 0..<n {
                if visted & (1 << x) != 0 {continue}
                for y in 0..<n {
                    if x == y {continue}
                    if visted & (1 << y) != 0 {continue}
                    if newLabel[x] != newLabel[y] {continue}

                    if (g[left].contains(x) && g[right].contains(y)) || (g[left].contains(y) && g[right].contains(x)) {
                        let curSb =   2 + dfs(min(x,y), max(x,y), visted | (1 << x) | (1 << y))
                        sb = max(sb,curSb)
                    }
                }
            }
            memo[left][right][visted] = sb
            return sb
        }


        var ans = 1
        for i in 0..<n {
            ans = max(ans, 1 + dfs(i, i, 1 << i))
        }

        let existedValus = Set(newLabel)
        for i in existedValus {
            if counter[i].count >= 2 {
                for k in counter[i] {
                    for j in counter[i] {
                        if k != j && newLabel[k] == newLabel[j] && g[k].contains(j) {
                            ans = max(ans, 2 + dfs(min(k,j), max(k,j),( 1 << k ) | (1 << j)))
                        }
                    }
                }
            }
        }
        return ans
    }
}
