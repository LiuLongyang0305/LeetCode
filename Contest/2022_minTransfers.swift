// https://leetcode.cn/contest/zj-future2022/problems/NBCXIp/
class Solution {
    func minTransfers(_ distributions: [[Int]]) -> Int {

        var map = [Int:Int]()

        distributions.forEach { dis in
            map[dis[0],default: 0] += dis[2]
            map[dis[1],default: 0] -= dis[2]
        }

        var values = [Int]()
        for (_,v) in map {
            if v != 0 {
                values.append(v)
            }
        }
        guard values.count > 2 else {
            return values.isEmpty ? 0 : 1
        }

        let N = values.count
        let maskLimit = (1 << N)
        var possibleMask = Set<Int>()
        for mask in 1..<maskLimit {
            var cur = 0
            for i in 0..<N {
                if mask & (1 << i) != 0 {
                    cur += values[i]
                }
            }
            if cur == 0 {
                possibleMask.insert(mask)
            }
        }


        var memo = [Int](repeating: -1, count: maskLimit)

        func dfs(_ visited: Int) -> Int {

            guard visited < maskLimit else {return 0}

            guard -1 == memo[visited] else {return memo[visited]}

            var ans = Int.max

            let remainMask = visited ^ (maskLimit - 1)
            ans = min(ans, remainMask.nonzeroBitCount - 1 )

            print(ans)
            var curMask = (remainMask - 1) & remainMask
            while curMask != remainMask {
                if possibleMask.contains(curMask) {
                    ans = min(ans,curMask.nonzeroBitCount - 1 + dfs(visited | curMask))
                }
                curMask = (curMask - 1) & remainMask
            }
            memo[visited] = ans
            return ans
        }
        return dfs(0)
    }
}