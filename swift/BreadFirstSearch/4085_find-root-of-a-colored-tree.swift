// https://leetcode.cn/problems/find-root-of-a-colored-tree/
class Solution {
    let colorToIntVal: [Character:Int] = ["R":0,"B":1,"W":2]
    func findColoredRoot(_ edges: [[Int]], _ colors: String) -> Int {
        let colorsVal = colors.map {colorToIntVal[$0]!}
        let (tree,root) = buildBinaryTree(edges, colorsVal.count,colorsVal)
        guard !tree.isEmpty else {return -1}
        guard root != -1 else {return -1}
        return isValidRoot(root, tree, colorsVal) ? root : -1
    }

    private func buildBinaryTree(_ edges:[[Int]],_ n: Int, _ colors:[Int]) -> ([[Int]], Int) {
        var tree = [[Int]](repeating: [], count: n)
        var degree = [Int](repeating: 0, count: n)
        func getDirection(_ a: Int, _ b: Int) -> (first:Int, second: Int)? {
            var (ca,cb) = (colors[a],colors[b])
            var (aCopy,bCopy) = (a,b)
            if ca > cb {
                swap(&ca, &cb)
                swap(&aCopy,&bCopy)
            }
            if cb - ca == 1 {
                return (aCopy,bCopy)
            }

            if cb == 2 && ca == 0 {
                return (bCopy,aCopy)
            }

            return nil
        }

        for e in edges {
            guard let p = getDirection(e[0], e[1]) else {
                return ([],-1)
            }
            tree[p.first].append(p.second)
            guard tree[p.first].count <= 2 else {
                return ([],-1)
            }
            degree[p.second] += 1
        }
        var possibleRoots = [Int]()
        for i in 0..<n {
            if degree[i] == 0 {
                possibleRoots.append(i)
            }
        }
        guard possibleRoots.count == 1 else {return ([],-1)}
        return (tree,possibleRoots[0])
    }


    private func isValidRoot(_ root: Int, _ tree: [[Int]], _ colors:[Int]) -> Bool {
        var visited = [Bool](repeating: false, count: tree.count)
        visited[root] = true
        var queue = [root]
        var curColor = colors[root] % 3

        while !queue.isEmpty {
            var newLevel = [Int]()
            let targetColor = (curColor + 1) % 3

            for node in queue {
                for child in tree[node] {
                    guard !visited[node] else {continue}
                    guard colors[child] == targetColor else {return false}
                    visited[child] = true
                    newLevel.append(child)
                }
            }
            queue = newLevel
        }

        return true
    }
}
