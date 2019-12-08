//https://leetcode.com/problems/group-the-people-given-the-group-size-they-belong-to/
class Solution1 {
    typealias GroupSize = Int
    typealias Indices = [Int]
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var map = [GroupSize:Indices]()
        for index in 0..<groupSizes.count {
            if nil == map[groupSizes[index]] {
                map[groupSizes[index]] = []
            }
            map[groupSizes[index]]?.append(index)
        }
        var ans = [[Int]]()
        for (groupSize,var indices) in map {
            if groupSize == 1 {
                ans.append(contentsOf: indices.map{[$0]})
                continue
            }
            for _ in 0..<(indices.count / groupSize) {
                ans.append([Int](indices[0..<groupSize]))
                indices.removeFirst(groupSize)
            }
        }
        return ans
    }
 }
 class Solution {
    typealias GroupSize = Int
    typealias Indices = [Int]
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var map = [GroupSize:Indices]()
        var ans = [[Int]]()
        for index in 0..<groupSizes.count {
            if groupSizes[index] == 1 {
                ans.append([index])
                continue
            }
            if nil == map[groupSizes[index]] {
                map[groupSizes[index]] = []
            }
            map[groupSizes[index]]?.append(index)
            if let count = map[groupSizes[index]]?.count, count == groupSizes[index] {
                ans.append(map[groupSizes[index]]!)
                map[groupSizes[index]] = []
            }
        }
        return ans
    }
 }