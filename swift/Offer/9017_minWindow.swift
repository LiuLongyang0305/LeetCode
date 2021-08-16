 // https://leetcode-cn.com/problems/M1oyTv/submissions/
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var targetCounter = [Character:Int]()
        for ch in t {
            targetCounter[ch,default: 0] += 1
        }
        let sToChars = [Character](s)
        var left = 0
        var right = 0
        let N = s.count
        var ans: (from:Int,length:Int) = (-1,Int.max)
        var currentCounter = [Character:Int]()
        
        func check() -> Bool {
            for (ch,cnt) in targetCounter {
                guard let c = currentCounter[ch], c >= cnt else {
                    return false
                }
            }
            return true
        }
        
        
        while right < N {
            while right < N && !check() {
                currentCounter[sToChars[right],default: 0 ] += 1
                right += 1
            }
            if !check() {
                break
            }
            while left <= right && check() {
                currentCounter[sToChars[left],default: 0] -= 1
                left += 1
            }
            let length = right - left + 1
            if length < ans.length {
                ans.from = left - 1
                ans.length = length
            }
        }
        return ans.length == Int.max ? "" : String(sToChars[ans.from...(ans.length - 1 + ans.from)])
    }
}