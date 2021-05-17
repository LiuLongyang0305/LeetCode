// https://leetcode.com/problems/sum-of-floored-pairs/
class Solution {
    private let MOD  = 1_000_000_007
    func sumOfFlooredPairs(_ nums: [Int]) -> Int {
        
        var ans = 0
        
        let maxEle = nums.max()!
        let minEle = nums.min()!
        
        var counter = Array<Int>(repeating: 0, count: maxEle  + 1)
        for num in nums {
            counter[num] += 1
        }
//        print(counter)
        var preffix = [0]
        for cnt in counter {
            preffix.append(preffix.last! + cnt)
        }
//        print(preffix)
        func getSum(of num:  Int) -> Int {
            var t = 0
            var d = 1
            while d * num <= maxEle {
                t  += d * (preffix[min(maxEle + 1, (d + 1) * num)] - preffix[d * num])
                d += 1
            }
//            defer {
//                print("\(num)  \(t)")
//            }
            return  t
        }
        for idx in minEle...maxEle {
            if counter[idx] > 0 {
                ans += (counter[idx] * getSum(of: idx) % MOD)
                ans %= MOD
            }
        }
        return ans %  MOD
    }
}