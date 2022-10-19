// https://leetcode.com/problems/closest-fair-integer/
class Solution {

    //奇偶数
    private typealias Pair = (odd:Int,even:Int)
    private let powerOfTen = [1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000,10000000000]
    func closestFair(_ n: Int) -> Int {

        var ans = n
        while true {
            let pair = judge(ans)
            guard pair.even != pair.odd else {return ans}
            let t = pair.odd + pair.even
            if t % 2 == 0 {
                ans += 1
            } else {
                ans = powerOfTen.first(where: { $0 > ans})!
            }


        }
        return ans
    }


    private func judge(_ n: Int) -> Pair {
        var ans: Pair = (0,0)
        var t = n
        while t > 0 {
            let digit = t % 10
            if digit & 1 == 0 {
                ans.even += 1
            } else {
                ans.odd += 1
            }
            t /= 10
        }
        return ans
    }


}