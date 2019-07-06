//https://leetcode.com/problems/jump-game/
class UnionFind {
    var parents: [Int]
    var connectedToFirstPosition = Set<Int>()
    init(size: Int) {
        parents = Array<Int>(0..<size)
    }
    func find(child: Int) -> Int {
        var current = child
        while current != parents[current] {
            current = parents[current]
        }
        var temp = child
        while temp != parents[temp] {
            let next = parents[temp]
            parents[temp] = current
            if current == 0 {
                connectedToFirstPosition.insert(temp)
            }
            temp = next
            
        }
        
        return current
    }
    func connected(first: Int, second: Int) -> Bool {
        return find(child: first) == find(child: second)
    }
    func union(first: Int, second : Int)  {
        let rootA = find(child: first)
        let rootB = find(child: second)
        if rootA != rootB {
            if rootA < rootB {
                parents[rootB] = rootA
            } else {
                parents[rootA] = rootB
            }
        }
    }
}

class Solution {
    
    func canJump(_ nums: [Int]) -> Bool {
        
        if nums.count < 2 {
            return true
        }
        //If all the numbers is not 0, return true
        if nums.filter({ (val) -> Bool in
            val == 0
        }).count == 0 {
            return true
        }
        let uf = UnionFind(size: nums.count)
        let size = nums.count
        var indices = [Int]()
        //To figure out if there is some positions from which we can jump to the last position
        for i in 0..<size - 1 {
            if nums[i] + i >= size - 1 {
                uf.connected(first: i, second: size - 1)
                indices.append(i)
            }
        }
        //If threre is no position to satisfied the commands, return false
        if indices.isEmpty {
            return false
        }
        
        for i in 0..<size {
            let end = min(i + nums[i], size - 1)
            if end >= i + 1 {
                let currentRange = (i + 1)...end
                if end == size - 1 {
                    if !Set<Int>(currentRange).intersection(uf.connectedToFirstPosition).isEmpty {
                        return true
                    }
                }
                for j in currentRange {
                    uf.union(first: i, second: j)
                }
                if uf.connected(first: 0, second: size - 1) {
                    return true
                }
            }
        }
        return false
    }
}