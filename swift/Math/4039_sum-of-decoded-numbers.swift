//https://leetcode.cn/problems/sum-of-decoded-numbers/
    class Solution {
        private let mod = 1_000_000_007
        func sumDecoded(_ nums: [Int]) -> Int {
            var sb = 0
            for num in nums {
                let (b,e) = decode(num)
                sb += fastPower(b, e)
                sb %= mod
            }
            return sb
        }
        private func decode(_ num: Int) -> (base:Int,exp:Int) {
            let width = num % 10
            let dStr = "\(num / 10)"
            let x = Int(dStr.prefix(width))!
            let y = Int(dStr.dropFirst(width))!
            return (x,y)
        }
        private func fastPower(_ base: Int, _ exp:Int) -> Int {
            guard exp > 0 else {return 1}
            let half = exp >> 1
            let t = fastPower(base, half) % mod
            let t1 = t * t % mod
            return t1 * (exp & 1 == 0 ? 1 : base) % mod
        }
    }
