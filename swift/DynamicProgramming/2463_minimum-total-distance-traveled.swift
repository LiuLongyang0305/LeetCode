 // https://leetcode.com/problems/minimum-total-distance-traveled/
class Solution {
    private let INF = Int.max >> 1
    func minimumTotalDistance(_ robot: [Int], _ factory: [[Int]]) -> Int {
        let sortedRobots = robot.sorted()
        let sortedfactory = factory.sorted { f1, f2 in
            f1[0] < f2[0]
        }

        let M = robot.count
        let N = factory.count


        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: N), count: M + 5)

        func dfs(_ factoryIdx:Int,_ robotIdx: Int) -> Int {
            guard robotIdx < M else {return 0}
            guard factoryIdx < N else {return INF}
            guard nil == memo[robotIdx][factoryIdx] else {return memo[robotIdx][factoryIdx]!}
            var ans = dfs(factoryIdx + 1, robotIdx)
            var curMoveDistance = 0
            var nextRobotIdx = robotIdx
            for _ in 0..<sortedfactory[factoryIdx][1] {
                guard nextRobotIdx < M else {break}
                curMoveDistance += abs(sortedRobots[nextRobotIdx] - sortedfactory[factoryIdx][0])
                nextRobotIdx += 1
                ans = min(ans, curMoveDistance + dfs(factoryIdx + 1, nextRobotIdx))
            }
            memo[robotIdx][factoryIdx] = ans
            return ans
        }


        return dfs(0, 0)
    }
}
