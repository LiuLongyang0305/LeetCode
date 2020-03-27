// https://leetcode.com/problems/magical-string/
class Solution {
    func magicalString(_ n: Int) -> Int {
        guard n > 3 else {
            return n != 0 ? 1 : 0
        }
        var magicStr = [1,2,2]
        var i = 2
        var last = 2
        var ans = 1
        while magicStr.count < n {
            let next = last == 1 ? 2 : 1
            if next == 1  {
                ans += min(magicStr[i], n - magicStr.count)
            }
            if magicStr[i] == 1 {
                magicStr.append(next)
            } else {
                magicStr.append(contentsOf: [next,next])
            }

            last = next
            i += 1
        }
        return  ans
    }
}