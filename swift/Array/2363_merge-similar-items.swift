 // https://leetcode.com/problems/merge-similar-items/
class Solution {

    func mergeSimilarItems(_ items1: [[Int]], _ items2: [[Int]]) -> [[Int]] {
        var valToWeight = [Int:Int]()
        for i in items1 {
            valToWeight[i[0], default: 0] += i[1]
        }
        for i in items2 {
            valToWeight[i[0], default: 0] += i[1]
        }
        let sortedPairs = valToWeight.sorted { p1, p2 in
            p1.key < p2.key
        }
        return sortedPairs.map { p in
            [p.key,p.value]
        }
    }
}