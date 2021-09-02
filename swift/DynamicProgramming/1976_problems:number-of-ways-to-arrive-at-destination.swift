// https://leetcode.com/problems/number-of-ways-to-arrive-at-destination/
extension Int {
    static var mod: Int {
        return 1_000_000_007
    }
}

class Solution {
    func countPaths(_ n: Int, _ roads: [[Int]]) -> Int {
        
        var  graph = Array<Array<Int>>(repeating: Array<Int>(repeating: Int.max, count: n), count: n)
        
        for road in roads {
            graph[road[0]][road[1]] = road[2]
            graph[road[1]][road[0]] = road[2]
            
        }
        
        var visited = Array<Bool>(repeating: false, count: n)
        var distances = Array<Int>(repeating: Int.max, count: n)
        var cnt = Array<Int>(repeating: 0, count: n)
        
        distances[0] = 0
        cnt[0] = 1
        
        for _ in 0..<n {
            var minEdgeVertex = -1
            for vertex in 0..<n {
                if !visited[vertex] && (minEdgeVertex == -1 || distances[minEdgeVertex] > distances[vertex]) {
                    minEdgeVertex = vertex
                }
            }
            visited[minEdgeVertex] = true
            for vertex in 0..<n {
                if graph[minEdgeVertex][vertex] != Int.max {
                    if !visited[vertex] {
                        let possibleMinDis = distances[minEdgeVertex] + graph[minEdgeVertex][vertex]
                        if distances[vertex] > possibleMinDis {
                            distances[vertex] = possibleMinDis
                            cnt[vertex] = cnt[minEdgeVertex]
                        } else if distances[vertex] == possibleMinDis {
                            cnt[vertex] = (cnt[vertex] + cnt[minEdgeVertex]) % Int.mod
                        }
                    }
                }
            }
        }
        return cnt[n - 1]
    }
}