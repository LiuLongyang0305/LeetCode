// https://leetcode.com/problems/restore-the-array/
class Solution {
    private let MOD = 1_000_000_007
    func numberOfArrays(_ s: String, _ k: Int) -> Int {
        let numbers = s.map { $0.wholeNumberValue!}
        guard numbers[0] >= 1 && numbers[0] <= k else {
            return 0
        }
        //当前已有方案计数：数组最后一个数字及其对应方案数目
        var counter = [Int:Int]()
        counter[numbers[0]] = 1
        for num in numbers.dropFirst() {
            var newCounter = [Int:Int]()
            if num >= 1 && num <= k {
                newCounter[num] = counter.values.reduce(0, {$0 + $1}) % MOD
            }
            for (lastNumber,cnt) in counter {
                let t = lastNumber * 10 + num
                if t <= k {
                    newCounter[t,default: 0 ] += cnt % MOD
                }
            }
            counter = newCounter
        }
        return counter.values.reduce(0) { $0 + $1} % MOD
    }
}