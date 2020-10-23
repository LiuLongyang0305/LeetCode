// https://leetcode.com/problems/campus-bikes-ii/
class Solution {
    private struct State: Hashable {
        var nextWorker: Int
        var visited: [Int]
    }
    func assignBikes(_ workers: [[Int]], _ bikes: [[Int]]) -> Int {
        let N = workers.count
        let M = bikes.count
        var distance = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: M), count: N)
        for i in 0..<N {
            for j in 0..<M {
                
                distance[i][j] = abs(workers[i][0] - bikes[j][0]) + abs(workers[i][1] - bikes[j][1])
            }
        }
        var memo = [State:Int]()
        var visited = Set<Int>()
        
        func backtracking(_ nextWorker: Int) -> Int {
            guard nextWorker < N else {
                return 0
            }
            let state = State(nextWorker: nextWorker, visited: visited.sorted())
            if let dis = memo[state] {
                return dis
            }
            var ans = Int.max
            for bike in 0..<M {
                guard !visited.contains(bike) else {
                    continue
                }
                visited.insert(bike)
                let res = distance[nextWorker][bike] + backtracking(nextWorker + 1)
                visited.remove(bike)
                ans = min(ans, res)
            }
            memo[state] = ans
            return ans
        }
        return  backtracking(0)
    }
}