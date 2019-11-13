//https://leetcode.com/problems/unique-number-of-occurrences/
class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var counter = [Int: Int]()
        for num in arr {
            if let c = counter[num] {
                counter.updateValue(c + 1, forKey: num)
            } else {
                counter.updateValue(1, forKey: num)
            }
        }
        return counter.count == Set<Int>(counter.values).count
    }
}