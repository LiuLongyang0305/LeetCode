// https://leetcode.com/problems/sort-the-people/
class Solution {
    func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
        let N = names.count
        let sortedIndex = (0..<N).sorted { heights[$0] > heights[$1] }
        return sortedIndex.map {names[$0]}
    }
}