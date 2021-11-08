// https://leetcode.com/problems/kth-distinct-string-in-an-array/
class Solution {
    func kthDistinct(_ arr: [String], _ k: Int) -> String {
        var map = [String: Int]()
        arr.forEach { map[$0, default: 0] += 1}
        var cnt = 0
        for str in arr {
            guard let c = map[str] else {
                continue
            }
            guard c == 1 else {
                continue
            }
            if cnt == k - 1 {
                return str
            }
            cnt += 1
        }
        return ""
    }
}