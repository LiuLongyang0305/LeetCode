//https://leetcode.com/problems/regions-cut-by-slashes/
class Solution {
    class UnionFind {
        var parents: [Int]
        init(size: Int) {
            parents = Array<Int>(0..<size)
        }
        func find(node: Int) -> Int {
            var currentParent = node
            
            while parents[currentParent] != currentParent {
                currentParent = parents[currentParent]
            }
            
            var temp = node
            while parents[temp] != temp {
                let next = parents[temp]
                parents[temp] = currentParent
                temp = next
            }
            return currentParent
        }
        
        func union(first: Int, second: Int)  {
            let fr = find(node: first)
            let sr = find(node: second)
            parents[fr] = sr
        }
    }
    
    func regionsBySlashes(_ grid: [String]) -> Int {
        let size = grid.count
        let unionFind = UnionFind(size: 4 * size * size)
        for row in 0..<size {
            let chars = Array<Character>(grid[row])
            for col in 0..<chars.count {
                let root = 4 * (row * size + col)
                switch chars[col] {
                case "/":
                    unionFind.union(first: root + 0, second: root + 1)
                    unionFind.union(first: root + 2, second: root + 3)
                case "\\":
                    unionFind.union(first: root + 0, second: root + 2)
                    unionFind.union(first: root + 1, second: root + 3)
                default:
                    unionFind.union(first: root + 0, second: root + 1)
                    unionFind.union(first: root + 2, second: root + 3)
                    unionFind.union(first: root + 0, second: root + 2)
                    unionFind.union(first: root + 1, second: root + 3)
                }
                
                if row + 1 < size {
                    unionFind.union(first: root + 3, second: root + 4 * size + 0)
                }
                if row - 1 >= 0 {
                    unionFind.union(first: root + 0, second: root - 4 * size + 3)
                }
                if col + 1 < size {
                    unionFind.union(first: root + 2, second: root + 4 + 1)
                }
                if col - 1 >= 0 {
                    unionFind.union(first: root + 1, second: root - 4  + 2)
                }
            }
        }
        var result = 0
        for i in 0..<unionFind.parents.count {
            if i == unionFind.find(node: i) {
                result += 1
            }
        }
        return result
    }
}