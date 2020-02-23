// https://leetcode.com/problems/find-the-city-with-the-smallest-number-of-neighbors-at-a-threshold-distance/ 
class Solution {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        var graph = Array<Array<Int>>(repeating: Array<Int>(repeating: Int.max, count: n), count: n)
        for edge in edges {
            graph[edge[0]][edge[1]] = edge[2]
            graph[edge[1]][edge[0]] = edge[2]
        }
        for bridge in 0..<n {
            for from in 0..<n {
                for to in 0..<n {
                    guard graph[from][bridge] != Int.max else {
                        continue
                    }
                    guard graph[bridge][to] != Int.max else {
                        continue
                    }
                    let dis = graph[from][bridge] + graph[bridge][to]
                    if graph[from][to] > dis {
                        graph[from][to] = dis
                    }
                }
            }
        }
        // print(graph)
        var city = -1
        var minCityCount = Int.max
        for from in 0..<n {
            var count = 0
            for to in 0..<n where to != from{
                if graph[from][to] <= distanceThreshold {
                    count += 1
                }
            }
            if count <= minCityCount {
                minCityCount = count
                city = from
            }
        }
        return city
    }
 }


