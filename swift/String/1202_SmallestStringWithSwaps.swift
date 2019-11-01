//https://leetcode.com/problems/smallest-string-with-swaps/
class UnionFind {
    private var parents: [Int]
    init(_ size: Int) {
        parents = Array<Int>(0..<size)
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
        let xRoot = find(node: x)
        return xRoot == find(node: y)
    }
}

class SwappableNodes {
    var nodes: [Int] = []
    var chars: [Character] = []
}

class Solution {
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        let uf = UnionFind(s.count)
        var visited = Set<Int>()
        for pair in pairs  {
            if !uf.connected(x: pair[0], y: pair[1]) {
                uf.union(x: pair[0], y: pair[1])
                visited.insert(pair[0])
                visited.insert(pair[1])
            }
        }
        var ans = [Character](s)
        var trees = [Int: SwappableNodes]()
        for i in 0..<s.count {
            if visited.contains(i) {
                let parent = uf.find(node: i)
                if nil == trees[parent] {
                    trees[parent] = SwappableNodes()
                }
                trees[parent]?.nodes.append(i)
                trees[parent]?.chars.append(ans[i])
            }
        }
        for (_ ,tree) in trees {
            let sortedTree = tree.chars.sorted()
            var j = 0
            for index in tree.nodes {
                ans[index] = sortedTree[j]
                j  += 1
            }
        }
        return String(ans)
    }
}