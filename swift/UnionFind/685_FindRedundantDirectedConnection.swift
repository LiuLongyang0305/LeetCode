//https://leetcode.com/problems/redundant-connection-ii/
class Solution {
    func findRedundantDirectedConnection(_ edges: [[Int]]) -> [Int] {
        guard edges.count > 3 else {
            return edges.count < 3 ? [Int]() : edges[2]
        }
        
        var parents = Array<Int>(repeating: -1, count: edges.count + 1)
        var children = Array<Array<Int>>(repeating: Array<Int>(), count: edges.count + 1)
        var potentionEdge = [Int]()
        var secondParent = -1
        var target = -1
        var root = -1
        var currentPath = [Int]()
        
        func dfs(root: Int) {
            if currentPath.contains(root) {
                potentionEdge = [currentPath.last!,root]
                return
            }
            currentPath.append(root)
            for child in children[root] {
                dfs(root: child)
            }
            currentPath.removeLast()
        }
        
        for edge in edges {
            let tail = edge[1]
            if parents[tail] == -1 {
                parents[tail] = edge[0]
            } else {
                secondParent = edge[0]
                target = tail
            }
            children[edge[0]].append(tail)
        }
        root = parents.lastIndex(of: -1)!
        root = root == 0 ? 1 : root
        target = -1 == target ? root : target
        
        dfs(root: target)
        return potentionEdge.isEmpty ? [secondParent,target] : potentionEdge
    }
}


class Solution2 {
    typealias Degree = (in1: Int,out: Int)
    func findRedundantDirectedConnection(_ edges: [[Int]]) -> [Int] {
        var reverseAdjancenyList = Array<Array<Int>>(repeating: Array<Int>(), count: edges.count + 1)
        var adjancenyList = Array<Array<Int>>(repeating: Array<Int>(), count: edges.count + 1)
        var degrees = Array<Degree>(repeating: (0,0), count: edges.count + 1)
        for edge in edges {
            degrees[edge[0]].out += 1
            degrees[edge[1]].in1 += 1
            reverseAdjancenyList[edge[1]].append(edge[0])
            adjancenyList[edge[0]].append(edge[1])
        }
        
        func valid(parent: Int, child: Int) -> Bool {
            
            var tempDegrees = degrees
            var tempAdjacencyList = adjancenyList
            
            tempDegrees[parent].out -= 1
            tempDegrees[child].in1 -= 1
            let children = tempAdjacencyList[parent]
            print([parent,child])
            for j in 0..<children.count {
                if children[j] == child {
                    tempAdjacencyList[parent].remove(at: j)
                    break
                }
            }
            
            var ans = 0
            var  queue = [Int]()
            for i in 1...edges.count {
                if tempDegrees[i].in1 == 0 {
                    queue.append(i)
                }
            }
            
            if queue.count != 1 {
                return false
            }
            
            var exisited = Set<Int>()
            while !queue.isEmpty {
                let length = queue.count
                ans += length
                for _ in 0..<length {
                    let currentNode = queue.removeFirst()
                    exisited.insert(currentNode)
                    for node in tempAdjacencyList[currentNode] {
                        if !exisited.contains(node) {
                            queue.append(node)
                        }
                    }
                }
            }
            return  ans == edges.count
        }
        
        for i in 1...edges.count {
            if degrees[i].in1 == 2 {
                let parents = reverseAdjancenyList[i].reversed()
                for parent in parents {
                    if valid(parent: parent, child: i) {
                        return [parent,i]
                    }
                }
            }
        }
        
        for i in (0..<edges.count).reversed() {
            var fromDegree = degrees[edges[i][0]]
            var toDegree = degrees[edges[i][1]]
            fromDegree.out -= 1
            toDegree.in1 -= 1
            if  toDegree.in1 != 0 || toDegree.out != 0 {
                return edges[i]
            }
        }
        
        return [Int]()
    }
}
