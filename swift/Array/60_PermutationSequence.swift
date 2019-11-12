//https://leetcode.com/problems/permutation-sequence
class Solution {
    private let factorial = [0, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]
    func getPermutation(_ n: Int, _ k: Int) -> String {
        return getPermutationByOrder([Int](1...n), k - 1)
    }
    func getPermutationByOrder(_ arr:  [Int], _ order: Int) -> String {
        guard order != 0 else {
            return arr.reduce("") {$0 + "\($1)"}
        }
        guard order != factorial[arr.count] - 1 else {
            return arr.reversed().reduce("") {$0 + "\($1)"}
        }
        var ans = ""
        let index = order / factorial[arr.count - 1]
        ans += "\(arr[index])"
        var arrCopy = arr
        arrCopy.remove(at: index)
        let  nextOrder = order % factorial[arr.count - 1]
        return ans + getPermutationByOrder(arrCopy, nextOrder)
    }
}