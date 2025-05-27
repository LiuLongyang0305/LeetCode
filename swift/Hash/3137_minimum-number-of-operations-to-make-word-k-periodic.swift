// https://leetcode.com/problems/minimum-number-of-operations-to-make-word-k-periodic/
class Solution {
    func minimumOperationsToMakeKPeriodic(_ word: String, _ k: Int) -> Int {

        var counter = [Int:Int]()
        let chars = [Character](word)
        for i in 0..<(word.count / k) {
            counter[chars[(i * k)...((i + 1) * k - 1)].hashValue,default: 0] += 1
        }

        return word.count / k - counter.values.max()!
    }
}
