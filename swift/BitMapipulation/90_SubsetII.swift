//https://leetcode.com/problems/subsets-ii/
class Solution {
    private let bits = (0...10).map { 1 << $0}
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var ans = Set<[Int]>()
        let N = nums.count
        let sortedNumbers = nums.sorted()
        (0...bits[N]).forEach { (v) in
            var cur = [Int]()
            for i in 0..<N {
                if v & bits[i] != 0 {
                    cur.append(sortedNumbers[i])
                }
            }
            ans.insert(cur)
        }
        return [[Int]](ans)
    }
}
