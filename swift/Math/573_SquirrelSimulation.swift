// https://leetcode.com/problems/squirrel-simulation/
class Solution {
    func minDistance(_ height: Int, _ width: Int, _ tree: [Int], _ squirrel: [Int], _ nuts: [[Int]]) -> Int {
        let treeToNuts = nuts.map {abs($0[0] - tree[0]) + abs($0[1] - tree[1])}
        let squirrelToNuts = nuts.map{abs($0[0] - squirrel[0]) + abs($0[1] - squirrel[1])}
        let totalDis = 2 * treeToNuts.reduce(0) { $0 + $1}
        var ans = Int.max
        for i in 0..<nuts.count {
            ans = min(ans, totalDis - treeToNuts[i] + squirrelToNuts[i])
        }
        return ans
    }
}