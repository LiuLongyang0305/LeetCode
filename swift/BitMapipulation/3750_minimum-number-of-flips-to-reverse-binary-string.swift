//https://leetcode.cn/problems/minimum-number-of-flips-to-reverse-binary-string/
class Solution {
    func minimumFlips(_ n: Int) -> Int {
        var sb = 0
        let reversedChars = [Character](getReversedDigits(of: n))
        let N =  reversedChars.count
        for i in 0..<N {
            if reversedChars[i] != reversedChars[N - 1 -  i] {
                sb += 1
            }
        }
        return sb
    }
    private func getReversedDigits(of num: Int) -> String {
        var sb = ""
        var  t =  num
        while t > 0 {
            sb.append("\(t % 2)")
            t /= 2
        }
        return sb
    }
}
