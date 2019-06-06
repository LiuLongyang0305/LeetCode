//https://leetcode.com/problems/unique-binary-search-trees/
class Solution {
    func numTrees(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
        }
        var numUnique = [Int]()
        numUnique.append(1)
        numUnique.append(1)
        for i in 2...n {
            var combine: Int = 0
            for j in 1...i {
                combine += numUnique[j - 1] * numUnique[i - j]
            }
            numUnique.append(combine)
        }
        return numUnique.last!
    }
}
