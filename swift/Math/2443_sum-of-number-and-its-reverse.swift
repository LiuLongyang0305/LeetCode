// https://leetcode.com/problems/sum-of-number-and-its-reverse/
class Solution {
    func sumOfNumberAndReverse(_ num: Int) -> Bool {
        for i in 0...num {
            let t = num - i
            let rev = revers(i)
            if t == rev {
                return true
            }
        }
        return false
    }

    private func revers(_ num: Int) -> Int {
        var ans = 0
        var t = num
        while t > 0 {
            ans = 10 * ans + (t % 10)
            t /= 10
        }
        return ans
    }
}