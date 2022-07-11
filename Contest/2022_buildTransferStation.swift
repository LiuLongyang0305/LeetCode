// https://leetcode.cn/contest/zj-future2022/problems/kflZMc/
class Solution {
    func buildTransferStation(_ area: [[Int]]) -> Int {
        let M = area.count
        let N = area[0].count
        var xs = [Int]()
        var ys = [Int]()
        for i in 0..<M {
            for j in 0..<N {
                if 1 == area[i][j] {
                    xs.append(i)
                    ys.append(j)
                }
            }
        }
        xs.sort()
        ys.sort()
        var ans = 0
        let px = xs[xs.count >> 1]
        let py = ys[ys.count >> 1]
        for x in xs {
            ans += abs(x - px)
        }
        for y in ys {
            ans += abs(y - py)
        }
        return ans
    }
}