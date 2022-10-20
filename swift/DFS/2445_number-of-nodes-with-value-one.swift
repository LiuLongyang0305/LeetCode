// https://leetcode.com/problems/number-of-nodes-with-value-one/
class Solution {
    func numberOfNodes(_ n: Int, _ queries: [Int]) -> Int {
        var flipCounter = [Int](repeating: 0, count: n + 1)
        for q in queries {
            flipCounter[q] += 1
        }
        // print(flipCounter)
        func  dfs(_ node: Int, _ cnt: Int ) -> Int {
            guard node <= n else {return 0}
            let newCnt = cnt + flipCounter[node]
            // print("\(node)   \(newCnt)")
            return (newCnt & 1) + dfs(node * 2, newCnt) + dfs(node * 2 + 1, newCnt)
        }
        return dfs(1, 0)
    }
}