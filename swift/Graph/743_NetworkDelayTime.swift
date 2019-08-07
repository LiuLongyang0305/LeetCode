//https://leetcode.com/problems/network-delay-time/
class Solution {
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        var costTime = Array<Array<Int>>(repeating: Array<Int>(repeating: Int.max , count: N + 1), count: N + 1)
        for time in times {
            costTime[time[0]][time[1]] = time[2]
        }
        
        for i in 0...N {
            costTime[i][i] = 0
        }
        
        for i in 1...N {
            for j in 1...N {
                for k in 1...N {
                    if !(costTime[j][i] == Int.max || costTime[i][k] == Int.max) {
                        costTime[j][k] = min(costTime[j][k], costTime[j][i] + costTime[i][k])
                    }
                }
            }
        }
        var distanceToK = costTime[K]
        distanceToK.removeFirst()
        let maxDistance = distanceToK.max()!
        return maxDistance == Int.max ? -1 : maxDistance
    }
}

class Solution2 {
    struct Edge {
        var from: Int
        var to: Int
        var weight: Int
    }
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        var  adjacencyList = Array<Array<Edge>>(repeating: Array<Edge>(), count: N + 1)
        var timeCostTo = Array<Int>(repeating: Int.max, count: N + 1)
        timeCostTo[K] = 0
        var edgeSet = [Int:Int]()
        for time in times {
            let edge = Edge(from: time[0], to: time[1], weight: time[2])
            adjacencyList[edge.from].append(edge)
        }
        
        edgeSet[K] = 0
        while !edgeSet.isEmpty {
            let sortedEdge = edgeSet.sorted { (e1, e2) -> Bool in
                e1.value < e2.value
            }
            let key =  sortedEdge.first!.key
            edgeSet.removeValue(forKey: key)
            for tempEdge in adjacencyList[key] {
                let to = tempEdge.to
                let tempTimeCost = timeCostTo[key]
                if tempTimeCost != Int.max {
                    if  timeCostTo[to] > tempTimeCost + tempEdge.weight {
                        timeCostTo[to] = tempTimeCost + tempEdge.weight
                        edgeSet[to] = tempEdge.weight
                    }
                }
            }
        }
        timeCostTo.removeFirst()
        let maxTime = timeCostTo.max()!
        return maxTime == Int.max ? -1 :  maxTime
    }
}


