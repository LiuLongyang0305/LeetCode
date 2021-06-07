// https://leetcode.com/problems/minimum-number-of-flips-to-make-the-binary-string-alternating/
class Solution {
    
    func minFlips(_ s: String) -> Int {
        guard s.count > 1 else {
            return 0
        }
        let sToInt = s.map { Int($0.asciiValue! - 48)}
        let N = s.count
        var infos = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 2), count: s.count + 1)
        infos[1][1 - sToInt[0]] += 1
        for idx in 1..<N {
            let j = idx + 1
            let length = idx  + 1
            var temp = infos[idx]
            if length % 2 == 0 {
                temp[sToInt[idx]] += 1
            } else {
                temp[1 - sToInt[idx]] += 1
            }
            infos[j] = temp
        }
        
        
        var ans = Int.max
        for idx in 0..<N {
            //字符串排列为s[idx..<N] + s[0..<(idx - 1)]
            let right = N - idx
            let left = idx
            var temp = 0
            //start with "0"
            if left % 2 == 0 {
                temp = infos[N][sToInt[idx]] - infos[idx][sToInt[idx]]
                if right % 2 == 0 {
                    temp += infos[idx][sToInt[idx]]
                } else {
                    temp += infos[idx][1 - sToInt[idx]]
                }
            } else {
                temp = infos[N][1 - sToInt[idx]] - infos[idx][1 - sToInt[idx]]
                if right % 2 == 0 {
                    temp += infos[idx][sToInt[idx]]
                } else {
                    temp += infos[idx][1 - sToInt[idx]]
                }
            }
            ans = min(ans, temp)
        }
        return  ans
    }
}