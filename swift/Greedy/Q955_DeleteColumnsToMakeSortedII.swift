//https://leetcode.com/problems/delete-columns-to-make-sorted-ii/
class Solution {
    func minDeletionSize(_ A: [String]) -> Int {
        if A.count  < 2 {
            return 0
        }
        var ACopy = A.map { (str) -> [Character] in
            Array<Character>(str)
        }
        var toDelete = Set<Int>()
        var exist = [Int]()
        for j in 0..<ACopy[0].count {
            for i in 1..<ACopy.count {
                if !toDelete.contains(j) {
                    
                    if ACopy[i][j] < ACopy[i - 1][j] {
                        if j == 0 {
                            toDelete.insert(j)
                        } else {
                            var k = 0
                            while k < exist.count {
                                if ACopy[i][exist[k]] != ACopy[i - 1][exist[k]] {
                                    break
                                }
                                k += 1
                            }
                            if k == exist.count {
                                toDelete.insert(j)
                            }
                        }
                    }
                }
            }
            if !toDelete.contains(j) {
                exist.append(j)
            }
        }
        return toDelete.count
    }
}