//https://leetcode.com/problems/redundant-connection/

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let size = edges.count + 1
        var parents = Array<Int>(repeating: -1, count: size)
        var children = Array<Array<Int>>(repeating: Array<Int>(), count: size)

        func getParents(){
            for edge in edges {
                children[edge[0]].append(edge[1])
                children[edge[1]].append(edge[0])
            }
            
            var currentLevel: [Int] = [edges[0][0]]
            var visited = Set<Int>()
            while !currentLevel.isEmpty  {
                let levelSize = currentLevel.count
                for _ in 0..<levelSize {
                    let level: Int = currentLevel.removeFirst()
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
            }
            parents[0] = -1
        }
        
        func getRedundantConnection() -> [Int]{
            
            
            var potensionEdgesArr = Array<Set<Array<Int>>>(repeating: Set<Array<Int>>(), count: 2)

            var target = Array<Int>()
            var nodes = Set<Int>()
            for childrenOfEachNode in children {
                for child in childrenOfEachNode {
                    if nodes.contains(child) {
                        target.append(child)
                    } else {
                        nodes.insert(child)
                    }
                }
            }
            target.sort()

            for i in 0...1 {
                var tempNode = target[i]
                var tempParent = parents[tempNode]
                
                while tempParent != -1 {
                    var tempEdge = [tempNode,tempParent]
                    tempEdge.sort()
                    potensionEdgesArr[i].insert(tempEdge)
                    tempNode = tempParent
                    tempParent = parents[tempNode]
                }
            }

            var potensionEdges = potensionEdgesArr[1].symmetricDifference(potensionEdgesArr[0])
            potensionEdges.insert(target)
            print(potensionEdges)
            var index = edges.index(before: edges.endIndex)
            while index >= edges.startIndex {
                if potensionEdges.contains(edges[index]){
                    return edges[index]
                }
                index = edges.index(before: index)
            }
            return [Int]()
        }
        
        guard edges.count > 3 else {
            return edges.count < 3 ? [Int]() : edges[2]
        }
        getParents()
        return getRedundantConnection()
    }
}


class SolutionWithUnionFound {
    class UnionFind {
        var parents: [Int]
        init(size: Int) {
            parents = Array<Int>(repeating: 0, count: size)
            for i in 0..<size {
                parents[i] = i
            }
        }
        
        public func union(x: Int,y: Int)  {
            let rootX = find(node: x)
            let rootY = find(node: y)
            parents[rootX] = rootY
        }
        public func find(node : Int) -> Int {
            var currentRoot = node
            var temp = node
            while parents[currentRoot] != currentRoot {
                currentRoot = parents[currentRoot]
            }
            
            while  temp != parents[temp]{
                let nextRoot = parents[temp]
                parents[temp] = currentRoot
                temp = nextRoot
            }
            return temp
        }
        public func connected(x: Int, y: Int) -> Bool {
            return find(node: x) == find(node: y)
        }
    }
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let size = edges.count + 1
        let unionFind = UnionFind(size: size)
        for edge in edges {
            print(unionFind.parents)
            if unionFind.connected(x: edge[0], y: edge[1]) {
                return edge
            } else {
                unionFind.union(x: edge[0], y: edge[1])
            }
        }
      return [Int]()
    }
}
