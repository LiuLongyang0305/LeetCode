// https://leetcode.cn/problems/maximum-total-damage-with-spell-casting
class Solution {
    func maximumTotalDamage(_ power: [Int]) -> Int {
        var counter = [Int:Int]()
        for p in power {
            counter[p,default: 0] += 1
        }
        counter[Int.min / 2] = 0
        var memo = [Int:Int]()
        let sortedCounter = counter.sorted { p1, p2 in
            p1.key < p2.key
        }
        let N = sortedCounter.count


        func dfs(_ idx: Int) -> Int {
            guard idx > 0 else {
                return 0
            }
            if let v = memo[idx] {return v}
            var j = idx
            while j >= 0 &&  sortedCounter[j].key >= sortedCounter[idx].key - 2 {
                j -= 1
            }
            memo[idx] = max(dfs(idx - 1),dfs(j) + sortedCounter[idx].key * sortedCounter[idx].value)
            return memo[idx]!
        }

        return dfs(N - 1)
    }
}