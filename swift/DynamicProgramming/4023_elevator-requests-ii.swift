// https://leetcode.cn/problems/elevator-requests-ii/
class Solution {
    func elevatorRequests(_ n: Int, _ start: Int, _ requests: [Int]) -> Int {
        let m = requests.count + 3
        let sortedRequests = ([-1,start,n] + requests).sorted()
        var memo = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 2), count: m), count: m)



        func dfs(_ left: Int, _ right: Int, _ isOnRight: Bool) -> Int {
            //出界
            if left == 0 || right == m - 1 {
                return Int.max / 2
            }
            //处理完所有的
            if left == 1 && right == m - 2 {
                return 0
            }
            if -1 != memo[left][right][isOnRight ? 0 : 1] {
                return memo[left][right][isOnRight ? 0 : 1]
            }
            let x = sortedRequests[isOnRight ? right : left]
            let remain = m - 3 - right + left
            let sb = min(dfs(left - 1, right, false) + remain * (x - sortedRequests[left - 1]),dfs(left, right + 1,true) + remain * (sortedRequests[right + 1] - x) )
            memo[left][right][isOnRight ? 0 : 1] = sb
            return sb
        }

        let i = sortedRequests.firstIndex(of: start)!
        return dfs(i, i, false)
    }
}
