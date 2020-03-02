// https://leetcode.com/problems/3sum-with-multiplicity/submissions/
class Solution {
    private let MOD = 1_000_000_007
    func threeSumMulti(_ A: [Int], _ target: Int) -> Int {
        var counter = [Int:Int]()
        A.forEach {counter.updateValue((counter[$0] ?? 0) + 1, forKey: $0)}
        var ans = 0
        var visited = Set<[Int]>()

        if target % 3 == 0 {
            let num = target / 3
            visited.insert([num,num,num])
            if let c = counter[num], c >= 3 {
                ans += (c * (c - 1) * (c - 2) / 6 ) % MOD
            }
        }
        for first in 0...target {
            let remain = target - first
            if remain % 2 == 0 {
                let second = remain >> 1
                visited.insert([first,second,second].sorted())
                if let c1 = counter[first], let c2 = counter[second], c2 >= 2 , first != second {
                    ans += (c1 * c2 * (c2 - 1) / 2) % MOD
                    
                }
            }
        }
        guard target > 1 else {
            return ans
        }
        for first in 0...(target - 1) {
            for second in (first + 1)...target {
                let third = target - first - second
                guard let c1 = counter[first], let c2 = counter[second], let c3 = counter[third] else {
                    continue
                }
                
                let arr = [first,second,third].sorted()
                if !visited.contains(arr) {
                    ans += c1 * c2 * c3 % MOD
                    visited.insert(arr)
                }
            }
        }
        return ans % MOD
    }
 }

