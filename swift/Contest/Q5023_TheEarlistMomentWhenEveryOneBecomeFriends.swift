class Solution {
    class UnionFind {
        var parents = [Int]()
        var connect = 0
        init(size: Int) {
            parents = Array<Int>(0..<size)
            connect = size - 1
        }
        private func find(person: Int) -> Int {
            var current = person
            while current != parents[current] {
                current = parents[current]
            }
            return current
        }
        func union(first: Int,second: Int)  {
            if !isAllKnown() {
                let root1 = find(person: first)
                let root2 = find(person: second)
                if root1 != root2 {
                    parents[root2] = root1
                    connect -= 1
                }
            }
        }
        func isAllKnown() -> Bool {
            return connect == 0
        }
    }
    
    func earliestAcq(_ logs: [[Int]], _ N: Int) -> Int {
        let uf = UnionFind(size: N)
        let logsCopy = logs.sorted { (log1, log2) -> Bool in
            log1[0] < log2[0]
        }
        for log in logsCopy {
            uf.union(first: log[1], second:log[2])
            
            if uf.isAllKnown() {
                return log[0]
            }
        }
        
        return -1
    }
}