 // https://leetcode.com/problems/decode-the-message/
class Solution {
    private let lowercases = [Character]("abcdefghijklmnopqrstuvwxyz")
    func decodeMessage(_ key: String, _ message: String) -> String {
        var map = [Character:Character]()
        var idx = 0
        for ch in key {
            guard ch != " " else {
                continue
            }
            if let _ = map[ch] {
                continue
            }
            map[ch] = lowercases[idx]
            idx += 1
            guard map.count < 26 else {break}
        }
        return  String(message.map {map[$0] ?? " "})
    }
}