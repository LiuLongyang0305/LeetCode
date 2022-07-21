// https://leetcode.com/problems/max-sum-of-a-pair-with-equal-sum-of-digits/
class Solution {

    private typealias Pair = (first:Int?,second: Int?)
    func maximumSum(_ nums: [Int]) -> Int {
        var map = [Int:Pair]()



        func update(_ key:Int, _ newVal: Int) {
            guard let f = map[key]?.first else {
                map[key] = (newVal,nil)
                return
            }
            guard let s = map[key]?.second else {

                map[key] = (max(newVal, f),min(newVal, f))
                return
            }
            if newVal >= f {
                map[key]?.second = f
                map[key]?.first = newVal
            } else if newVal > s {
                map[key]?.second = newVal
            }
        }



        for num in nums {
            update(getDigitsSum(of: num), num)
        }

        var ans = -1

        for (_,pair) in map {
            guard let f = pair.first, let s = pair.second else {continue}
            ans = max(ans, f + s)
        }
        return ans
    }


    private func  getDigitsSum(of num: Int) -> Int {

        var ans = 0
        var temp = num
        while temp > 0 {
            ans += temp % 10
            temp /= 10
        }
        return ans
    }
}