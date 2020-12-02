// https://leetcode-cn.com/problems/closed-number-lcci/
extension Int {
    var ctz: Int {
        var ans = 0
        var temp = self
        while temp & 0x1 == 0 {
            temp = temp >> 1
            ans += 1
        }
        return ans
    }
    var onesCnt: Int {
        var cnt = 0
        var temp = self
        while temp > 0 {
            cnt += 1
            temp &=  (temp - 1)
        }
        return cnt
    }
}
class Solution {
    func findClosedNumbers(_ num: Int) -> [Int] {
        var ans = [-1,-1]
        let N = num.onesCnt
        for big in (num + 1)...(num << 1) {
            if big.onesCnt == N {
                ans[0] = big
                break
            }
        }
        for small in stride(from: num - 1, through: num >> 1, by: -1) {
            if small.onesCnt == N {
                ans[1] = small
                break
            }
        }
        return ans
    }
}
