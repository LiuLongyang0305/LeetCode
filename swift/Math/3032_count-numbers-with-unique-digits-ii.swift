// https://leetcode.cn/problems/count-numbers-with-unique-digits-ii/
func getPreffixSum() -> [Int] {
    var ans = [0]
    var cnt = 0
    func check(_ num: Int) -> Bool {
        var existedDigits = [Bool](repeating: false, count: 10)
        var t = num
        while t > 0 {
            let m = t % 10
            guard !existedDigits[m] else {return false}
            existedDigits[m] = true
            t /= 10
        }
        return true
    }
    for i in 0...1000{
        if check(i) {
            cnt += 1
        }
        ans.append(cnt)
    }

    return ans
}
let preffixSum = getPreffixSum()
class Solution {
    func numberCount(_ a: Int, _ b: Int) -> Int {
        return preffixSum[b + 1] - preffixSum[a]
    }
}
