// https://leetcode.com/problems/string-compression-ii/
class Solution {
    private let N = 127
    //dp[left][k]:the minimal coding size for substring s[left:] and remove at most at k
    private var dp = [[Int]]()
    private var chars: [Int] = []
    private var n = -1
    
    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
        guard k < s.count else {
            return 0
        }
        guard s.count > 1 else {
            return s.count
        }
        self.dp = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: 127), count: 127)
        self.n = s.count
        self.chars = s.map({ Int($0.asciiValue!) - 97})
        return solve(0, k)
    }
    
    private func getLengthOfDigit(_ x : Int) -> Int {
        return x == 1 ? 0 : (x < 10 ? 1 : (x < 100 ? 2 : 3))
    }
    
    private func solve(_ left: Int, _ k: Int) -> Int {
        guard k >= 0 else {
            return N
        }
        if left >= N || n - left <= k {
            return 0
        }
        var ans = dp[left][k]
        guard ans == -1 else {
            return ans
        }
        ans = N
        var cnt = Array<Int>(repeating: 0, count: 26)
        var j = left
        var most = 0
        while j < n {
            cnt[chars[j]] += 1
            most = max(most, cnt[chars[j]])
            ans = min(ans, 1 + getLengthOfDigit(most) + solve(j + 1, k - (j - left + 1 - most)))
            j += 1
        }
        dp[left][k] = ans
        return ans
    }
}




class Solution {
    
    private struct State: Hashable {
        var CompressedLength: Int
        var last: Character
        var cnt: Int
    }
    
    private let space: Character = " "
    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
        
        //可以全部移除
        guard k < s.count else {
            return 0
        }
        //只有一个字符
        guard s.count > 1 else {
            return s.count
        }
        //移除之后如果剩下少于两个字符，则无法继续压缩
        guard s.count - k > 2 else {
            return s.count - k
        }
        
        
        var lastLevel = [State:Int]()
        //处理第一个字符，删除或者不删除
        lastLevel[State(CompressedLength: 0, last: s.first!, cnt: 1)] = 0
        if k >= 1 {
            lastLevel[State(CompressedLength: 0, last: space, cnt: 0)] = 1
        }
        
        for ch in s.dropFirst() {
            
            var newLevel = [State:Int]()
            for (s,removedCnt) in lastLevel {
                
                //删除当前字符
                if removedCnt + 1 <= k {
                    let new = State(CompressedLength: s.CompressedLength, last: s.last, cnt: s.cnt)
                    let t = newLevel[new] ?? 1000
                    newLevel[new] = min(removedCnt + 1, t)
                }
                //不删除当前字符
                if s.last == " " {
                    //前面所有字符都被删除
                    let new = State(CompressedLength: 0, last: ch, cnt: 1)
                    let t = newLevel[new] ?? 1000
                    newLevel[new] = min(removedCnt, t)
                } else {
                    var newState = s
                    //当前字符雨上一个字符相同
                    if ch == s.last {
                        newState.cnt += 1
                    } else {
                        //不同，则需要更新已经压缩的字符串的长度
                        newState.CompressedLength += 1 + (s.cnt == 1 ? 0 : (s.cnt < 10 ? 1 : (s.cnt < 100 ? 2 : 3)))
                        newState.last = ch
                        newState.cnt = 1
                    }
                    //贪心保存
                    let t = newLevel[newState] ?? 1000
                    newLevel[newState] = min(t, removedCnt)
                }
                
            }
            lastLevel = newLevel
        }
        var ans = 1000
        for (s,_) in lastLevel {
            ans = min(ans, s.CompressedLength + (1 + (s.cnt == 1 ? 0 : (s.cnt < 10 ? 1 : (s.cnt < 100 ? 2 : 3)))))
        }
        return ans
    }
}



