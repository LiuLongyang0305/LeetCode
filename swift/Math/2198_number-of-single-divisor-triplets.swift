// https://leetcode.com/problems/number-of-single-divisor-triplets/
class Solution {
    private typealias Triplet = (first:Int,second:Int,third:Int)
    private var possibleTriplets = [Triplet]()
    init() {
        var i = 1
        while i <= 100 {
            var j = i
            while j <= 100 {
                var k = j
                while k <= 100 {
                    let s = i + j + k
                    if (s % i == 0 && s % j != 0 && s % k != 0) || (s % i != 0 && s % j == 0 && s % k != 0) || (s % i != 0 && s % j != 0 && s % k == 0) {
                        possibleTriplets.append((i,j,k))
                    }
                    k += 1
                }
                j += 1
            }
            i += 1
        }
        // print(possibleTriplets)
    }
    func singleDivisorTriplet(_ nums: [Int]) -> Int {
        var ans = 0
        var counter = [Int](repeating: 0, count: 101)
        nums.forEach { counter[$0] += 1 }
        for (f,s,t) in possibleTriplets {
            if f != s && s != t {
                ans += counter[f] * counter[s] * counter[t] * 6
            }
         if f == s {
                ans += counter[f] * (counter[f] - 1) * counter[t] * 3
            }
             if s == t {
                ans += counter[f] * counter[s] * (counter[s] - 1) * 3
            }
        }
        return ans
    }
}