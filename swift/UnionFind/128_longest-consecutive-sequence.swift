// https://leetcode.com/problems/longest-consecutive-sequence/
class Solution {
    private var parent = [Int:Int]()
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        parent = [:]
        let numsSet = [Int](Set<Int>(nums))
        for num in numsSet {
            union(num)
        }
        var rootToCnt = [Int:Int]()
        for num in numsSet {
            rootToCnt[find(num), default: 0] += 1
        }
        return rootToCnt.values.max()!
    }
    private func find(_ num: Int) -> Int {
        if nil == parent[num] {
            parent[num] = num
            return num
        }
        var temp = num
        while let p = parent[temp], p != temp {
            temp = p
        }
        return temp
    }
    
    private func union(_ num: Int)  {
        let p = find(num)
         if let p1 = parent[num - 1] {
            parent[p] = p1
            if let p2 = parent[num + 1] {
                parent[p2] = p1
            }
        } else if let p2 = parent[num + 1] {
            parent[p] = p2
        }
    }
}


