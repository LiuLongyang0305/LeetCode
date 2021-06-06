// https://leetcode.com/problems/distinct-subsequences/
typealias StringInfo = (arr:[Int], existChars: Int)
extension String {
    var info:StringInfo {
        var ans: StringInfo = ([],0)
        for ch in self {
            let i = ch.isUppercase ? Int(ch.asciiValue!) - 65 + 26 : Int(ch.asciiValue!) - 97
            ans.arr.append(i)
            ans.existChars |= (1 << i)
        }
        return ans
    }

}

class Solution {
    private var tree = Array<[Int]>(repeating: [], count: 52)
    private var s = [Int]()
    private var t = [Int]()
    private var memo = [[Int]]()
    func numDistinct(_ s: String, _ t: String) -> Int {
        
        let sInfo = s.info
        let tInfo = t.info
        
        guard tInfo.existChars & sInfo.existChars == tInfo.existChars else {
            return 0
        }
        
        self.s = sInfo.arr
        self.t = tInfo.arr
        
        self.tree =  Array<[Int]>(repeating: [], count: 52)
        self.memo = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: t.count ), count: s.count)
        
        for idx in 0..<s.count {
            guard tInfo.existChars & (1 << self.s[idx]) != 0 else {
                continue
            }
            tree[self.s[idx]].append(idx)
        }
        var ans = 0
        for startIdx in self.tree[self.t[0]] {
            ans += dfs(startIdx, 1)
        }
        
        return ans
    }
    
    private func dfs(_ lastIdx: Int, _ tIdx: Int) -> Int {
        guard tIdx < t.count else {
            return 1
        }
        guard !tree[t[tIdx]].isEmpty else {
            return 0
        }
        guard memo[lastIdx][tIdx] == -1 else {
            return memo[lastIdx][tIdx]
        }
        var ans = 0
        for idx in tree[t[tIdx]] {
            guard idx > lastIdx else {
                continue
            }
            ans += dfs(idx, tIdx + 1)
        }
        memo[lastIdx][tIdx] = ans
        return ans
    
    }
    
    
}