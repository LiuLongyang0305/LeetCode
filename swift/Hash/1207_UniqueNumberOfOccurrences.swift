//https://leetcode.com/problems/unique-number-of-occurrences/
class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var cnt = [Int:Int]()
        arr.forEach { cnt[$0, default: 0] += 1}
        var visited = Set<Int>()
        for (_,c) in cnt {
            guard !visited.contains(c) else {
                return false
            }
            visited.insert(c)
        }
        return true
    }
}