//https://leetcode.com/problems/sum-of-distances-in-tree/

// This idea is right! However, it will exceed the time limit with a large amount of input(10000 nodes)!
class Solution1 {
    func sumOfDistancesInTree(_ N: Int, _ edges: [[Int]]) -> [Int] {
        var sumDistances = Array<Int>()
        var distances = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: N)
        var parents = Array<Int>(repeating: -1, count: N)
        var levelNum = 0
        var nodesLevel = Array<Int>(repeating: 0, count: N)
        var children = Array<Array<Int>>(repeating: Array<Int>(), count: N)
        var currentPath = [Int]()
        func getParents(){
            for edge in edges {
                children[edge[0]].append(edge[1])
                children[edge[1]].append(edge[0])
                
                /******** Process distance between father and son *************/
                distances[edge[0]][edge[1]] = 1
                distances[edge[1]][edge[0]] = 1
            }
            var currentLevel: [Int] = [0]
            var visited = Set<Int>()
            while !currentLevel.isEmpty {
                let levelSize = currentLevel.count
                for _ in 0..<levelSize {
                    let level: Int = currentLevel.removeFirst()
                    nodesLevel[level] = levelNum
                    visited.insert(level)
                    for child in children[level] {
                        if -1 == parents[child] {
                            parents[child] = level
                            children[child].removeAll { (val) -> Bool in
                                val == level
                            }
                        }
                        if !visited.contains(child) {
                            currentLevel.append(child)
                        }
                    }
                }
                levelNum += 1
            }
            parents[0] = -1
        }
        // process distance between the node with same parent
        func processDistanceAmongChild() {
            for child in children {
                switch child.count {
                case 2:
                    distances[child[0]][child[1]] = 2
                    distances[child[1]][child[0]] = 2
                case 3...:
                    for i in 0..<child.count {
                        for j in (i +  1)..<child.count {
                            distances[child[i]][child[j]] = 2
                            distances[child[j]][child[i]] = 2
                        }
                    }
                default:
                    continue
                }
            }
        }
        

        //Process distances of each path
        func dfs(child: Int) {
            currentPath.append(child)
            if currentPath.count >= 2 {
                let j = currentPath.count - 1
                let last = currentPath.last!
                for i in 0..<j {
                    if distances[currentPath[i]][last] == 0 {
                        let dis = j - i
                        distances[currentPath[i]][last] = dis
                        distances[last][currentPath[i]] = dis
                    }
                }
            }
            if !children[child].isEmpty {
                for child in  children[child] {
                    dfs(child: child)
                }
            }
            currentPath.removeLast()
        }
        
        func getDistance(){
            
            for i in 1..<N {
                for j in (i + 1)..<N {
                    if distances[i][j] == 0 {
                        var currentDistance = 0
                        var minLevel = 0
                        var maxLevel = 0
                        
                        switch (nodesLevel[i] - nodesLevel[j]) {
                        case 1...:
                            (maxLevel,minLevel) = (i,j)
                        case 0:
                            (maxLevel,minLevel) = (i,j)
                        default:
                            (maxLevel,minLevel) = (j,i)
                        }
                        
                        let deltaLevel = abs(nodesLevel[i] - nodesLevel[j])
                        if deltaLevel > 0 {
                            for _ in 1...deltaLevel {
                                if 0 != maxLevel {
                                    maxLevel = parents[maxLevel]
                                }
                            }
                        }
                        
                        currentDistance = deltaLevel
                        while maxLevel != minLevel {
                            if distances[maxLevel][minLevel] != 0 {
                                currentDistance += distances[maxLevel][minLevel]
                                break
                            } else {
                                maxLevel = parents[maxLevel]
                                minLevel = parents[minLevel]
                                currentDistance += 2
                            }
                        }
                        distances[i][j] = currentDistance
                        distances[j][i] = currentDistance
                    }
                }
            }
        }
        
        func getSumDistances() {
            for i in 0..<N {
                var sum = 0
                for j in 0..<N {
                    sum += distances[i][j]
                }
                sumDistances.append(sum)
            }
        }
        
        getParents()
        processDistanceAmongChild()
        dfs(child: 0)
        getSumDistances()
        return sumDistances
    }
}