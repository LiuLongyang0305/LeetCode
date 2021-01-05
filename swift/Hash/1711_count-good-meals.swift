// https://leetcode.com/problems/count-good-meals/
class Solution {
    private struct Pair: Hashable {
        var small:Int
        var big: Int
    }
    private let MOD = 1_000_000_007
    func countPairs(_ deliciousness: [Int]) -> Int {
        var ans = 0
        var counter = [Int:Int]()
        deliciousness.forEach {counter[$0,default: 0 ] += 1}
        let sortedCounter = counter.sorted { (arg0, arg1) -> Bool in
            arg0.key < arg1.key
        }
        // print(sortedCounter)
        let targetDeciliousSum = (0...22).map { 1 << $0}
        var visited = Set<Pair>()
        for (d1,cnt) in sortedCounter {
            for sum in targetDeciliousSum {
                let d2 = sum - d1
                if let cnt2 = counter[d2] {
                    let k = Pair(small: min(d1, d2), big: max(d1, d2))
                    guard !visited.contains(k) else {
                        continue
                    }
                    // print("d1 = \(d1) cnt = \(cnt)  d2 = \(d2)  cnt2 = \(cnt2)")
                    visited.insert(k)
                    if d1 == d2 {
                        ans = (ans + cnt * (cnt - 1) / 2) % MOD
                    } else {
                        ans = (ans + cnt * cnt2) % MOD
                    }
                }
            }
        }
        return ans % MOD
    }
}


