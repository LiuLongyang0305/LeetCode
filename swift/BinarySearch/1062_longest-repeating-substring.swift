// https://leetcode.com/problems/longest-repeating-substring/
class Solution {
    func longestRepeatingSubstring(_ S: String) -> Int {
        guard Set<Character>(S).count < S.count else {
            return 0
        }
        var ans = 1
        var low = 1
        var high = S.count - 1
        let chars = [Character](S)
        func check(_ length: Int) -> Bool {
            var existed = Set<String>()
            var curStr = ""
            for i in 0..<S.count {
                curStr.append(chars[i])
                guard curStr.count >= length else {
                    continue
                }
                if curStr.count > length {
                    curStr.removeFirst()
                }
                if existed.contains(curStr) {
                    return true
                }
                existed.insert(curStr)
            }
            return false
        }
        while low < high {
            let mid = low + (high - low) >> 1
            if check(mid) {
                ans = max(ans, mid)
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        if check(low) {
            ans = max(ans, low )
        }
        return ans == Int.min ? 0 : ans
    }
}

