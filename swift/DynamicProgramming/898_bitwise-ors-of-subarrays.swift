// https://leetcode.com/problems/bitwise-ors-of-subarrays/
class Solution {
    func subarrayBitwiseORs(_ A: [Int]) -> Int {
        let N = A.count
        guard N > 1 else {
            return N
        }
        var existed = Set<Int>()
        var last = Set<Int>()
        for num in A {
            var new = Set<Int>()
            new.insert(num)
            for ele in last {
                new.insert(ele | num)
            }
            last = new
            for ele in new {
                if !existed.contains(ele) {
                    existed.insert(ele)
                }
            }
        }
        return existed.count
    }
}