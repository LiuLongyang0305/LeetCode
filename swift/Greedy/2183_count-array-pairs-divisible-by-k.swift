// https://leetcode.com/problems/count-array-pairs-divisible-by-k/
class Solution {
    func countPairs(_ nums: [Int], _ k: Int) -> Int {
        var  counter = [Int:Int]()
        func  updateCounter(_ num: Int) {
            var i = 1
            while i <= num / i {
                if num % i == 0 {
                    counter[i,default: 0] += 1
                    let another = num / i
                    if another != i {
                        counter[another, default: 0] += 1
                    }
                }
                i += 1
            }
        }

        var ans = 0
        for num in nums {
            let t = gcd(num, k)
            let another = k / t
            ans += (counter[another] ?? 0)
            updateCounter(num)
        }
        return ans
    }
    private func  gcd(_ x: Int, _ y: Int) -> Int {
        guard x % y != 0 else {return y}
        return gcd(y, x % y)
    }
}