// https://leetcode.com/problems/rank-transform-of-an-array/
class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        let sortedArr = Set<Int>(arr).sorted()
        var map = [Int:Int]()
        for (index,val) in sortedArr.enumerated() {
            map[val] = index + 1
        }
        return arr.map {map[$0]!}
    }
 }