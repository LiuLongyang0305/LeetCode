// https://leetcode.com/problems/decode-the-slanted-ciphertext/
class Solution {
    func decodeCiphertext(_ encodedText: String, _ rows: Int) -> String {
        guard rows > 1 else {return encodedText}
        let N = encodedText.count
        let cols = N / rows
        let chars = [Character](encodedText)
        var ans = ""
        for col in 0..<cols {
            var cur = ""
            for delta in 0..<rows {
                let nr = delta
                let nc = col + delta
                guard nr >= 0 && nr < rows && nc >= 0 && nc < cols else {
                    continue
                }
                cur.append(chars[cols * nr + nc])
            }
            ans += cur;
        }
        while let c = ans.last, c == " " {
            ans.removeLast()
        }
        return ans
    }
}