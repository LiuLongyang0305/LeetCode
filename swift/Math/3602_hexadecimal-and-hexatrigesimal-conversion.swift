//https://leetcode.cn/problems/hexadecimal-and-hexatrigesimal-conversion/
class Solution {
    let thirtySixChars: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9","a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    func concatHex36(_ n: Int) -> String {

        return (String(n * n, radix: 16) + getThirtySixDes(of: n * n * n)).uppercased()
    }

    private func getThirtySixDes(of num: Int) -> String {
        var t = num
        var ans = ""
        while t > 0 {
            ans.append(thirtySixChars[t % 36])
            t /= 36
        }
        return String(ans.reversed())
    }

}
