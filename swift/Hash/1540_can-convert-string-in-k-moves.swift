// https://leetcode.com/problems/can-convert-string-in-k-moves/
class Solution {
    func canConvertString(_ s: String, _ t: String, _ k: Int) -> Bool {
        guard s.count == t.count else {
            return false
        }
        let sChars = [Character](s)
        let tChars = [Character](t)
        let N = s.count
        var cnt = Array<Int>(repeating: 0, count: 26)
        for i in 0..<N {
            if sChars[i] != tChars[i] {
                let step = (Int(tChars[i].asciiValue!) - Int(sChars[i].asciiValue!) + 26) % 26
                cnt[step] += 1
            }
            
        }
        for i in 0..<26 {
            guard i +  (cnt[i] - 1) * 26 <= k  else {
                return false
            }
        }
        return true
    }
}

