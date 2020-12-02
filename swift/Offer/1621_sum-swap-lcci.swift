// https://leetcode-cn.com/problems/sum-swap-lcci/
class Solution {
    func findSwapValues(_ array1: [Int], _ array2: [Int]) -> [Int] {
        let array1Sum = array1.reduce(0) {$0 + $1}
        let array2Sum = array2.reduce(0) { $0 + $1}
        let delta = array2Sum - array1Sum
        guard delta % 2 == 0 else {
            return []
        }
        let array2Set = Set<Int>(array2)
        for num in array1 {
            let target = (delta + num * 2) >> 1
            if array2Set.contains(target) {
                return [num,target]
            }
        }
        return []
    }
}
