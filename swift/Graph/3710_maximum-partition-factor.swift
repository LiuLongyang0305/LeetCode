// https://leetcode.cn/problems/maximum-partition-factor/
class Solution {
    private enum Color{
        case blank
        case red
        case green
    }
    func maxPartitionFactor(_ points: [[Int]]) -> Int {
        let M = points.count
        if M <= 2 {return 0}
//        let N = points[0].count

        var maxManhattanDistance = 0
        var manhattanDistance = [[Int]](repeating: [Int](repeating: -1, count: M), count: M)
        for i in 0..<M {
            for j in 0..<M {
                manhattanDistance[i][j] = abs(points[i][0] - points[j][0]) + abs(points[i][1] - points[j][1])
                maxManhattanDistance = max(maxManhattanDistance,manhattanDistance[i][j])
            }
        }

        func check(_ distanceLimit: Int) -> Bool {
            // print(distanceLimit)

            var graph = [Set<Int>](repeating: [], count: M)
            for i in 0..<M {
                for j in 0..<M {
                    if manhattanDistance[i][j] < distanceLimit {
                        graph[i].insert(j)
                        graph[j].insert(i)
                    }
                }
            }

            var colored = [Color](repeating: .blank, count: M)

            func dfs(_ node: Int, _ color: Color) -> Bool {
                colored[node] = color
                for next in graph[node] {
                    if next == node {continue}
                    if colored[next] == color || (colored[next] == .blank && !dfs(next, color == .green ? .red : .green)) {
                        return false
                    }
                }
                return true
            }

            for i in 0..<M {
                if colored[i] == .blank {
                    if !dfs(i, .red) {
                        return false
                    }
                }
            }

            return true
        }



        var l = 0
        var r = maxManhattanDistance

        while l < r {
            let m = (l + r + 1) >> 1
            if check(m) {
                l = m
            } else {
                r = m - 1
            }
        }
        return l
    }
}

