// https://leetcode.com/problems/confusing-number-ii/
extension Array  where Element == Character {
    public static func < (lhs: Array<Character>, rhs: Array<Character>) -> Bool {
        if lhs.count != rhs.count {
            return lhs.count < rhs.count
        }
        guard lhs != rhs else {
            return false
        }
        let N = lhs.count
        var i = 0
        while i < N {
            guard lhs[i] == rhs[i] else {
                break
            }
            i += 1
        }
        return lhs[i] < rhs[i]
    }
    
}
class Solution {
    private var ans = 0
    private let map: [Character:Character] = ["1":"1","0":"0","6":"9","9":"6","8":"8"]
    private var low = [Character]()
    private var high = [Character]()
    func strobogrammaticInRange(_ low: String, _ high: String) -> Int {
        guard high.count >= low.count else {
            return 0
        }
        if high.count == low.count {
            guard high > low else {
                return check([Character](low)) ? 1 : 0
            }
        }
        
        self.ans = 0
        self.high = [Character](high)
        self.low = [Character](low)
        if self.low == ["0"] {
            ans += 1
        }
        dfs([])
        dfs(["0"])
        dfs(["1"])
        dfs(["8"])
        return ans
    }
    
    private func check(_ str: [Character]) -> Bool {
        guard !str.isEmpty else {
            return false
        }
        
        var i = 0
        var j = str.count - 1
        while i <= j {
            guard let r = map[str[j]], let _ = map[str[i]], r == str[i] else {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
    
    private func dfs(_ cur: [Character]) {

        if !cur.isEmpty && cur[0] != "0" && !(cur < low) && (cur < high || cur == high) {
            ans += 1
        }
        guard cur.count + 2 <= high.count else {
            return
        }
        for (c1,c2) in map {
            dfs([c1] + cur + [c2])
        }
    }
}