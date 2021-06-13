// https://leetcode.com/problems/merge-triplets-to-form-target-triplet/
class Solution {
    func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
        var first = Int.min
        var second = Int.min
        var third = Int.min
        for triple in triplets {
        if triple[0] <= target[0] && triple[1] <= target[1] && triple[2] <= target[2] {
                first = max(first, triple[0])
                second = max(second, triple[1])
                third = max(third, triple[2])
            }
        }
        
        return [first,second,third] == target
    }
}