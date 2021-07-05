// https://leetcode.com/problems/longest-common-subpath/
class Solution {
    private var paths = [[Int]]()
    
    private let base1 = 101
    private let base2 = 103
    private let mod1 = 1000000007
    private let mod2 = 1000000009
    
    private var cnt = [Int:Int]()
    private var hashToPathNumber = [Int:Int]()
    private var pathsCnt = -1

    private func check(_ length: Int) -> Bool {
        
        cnt = [:]
        hashToPathNumber = [:]
        
        let RM1 = power(base1, length - 1, mod1)
        let RM2 = power(base2, length - 1, mod2)
        
        for pathIdx  in 0..<pathsCnt {
            //处理每个长度位length的子串
            let path = paths[pathIdx]
            let N = path.count

            var hash1 = 0
            var hash2 = 0
            
            for idx in 0..<length {
                hash1 = (hash1 * base1 + path[idx]) % mod1
                hash2 = (hash2 * base2 + path[idx]) % mod2
            }
            
            var hash = (hash1 << 32) | hash2
            if nil == cnt[hash] || (hashToPathNumber[hash] ?? -1) != pathIdx {
                cnt[hash, default: 0 ] += 1
                hashToPathNumber[hash] = pathIdx
            }
            
            
            for  idx in 0..<(N - length) {
                hash1 = ((hash1 + mod1 - path[idx] * RM1 % mod1) * base1 + path[idx + length ]) % mod1
                hash2 = ((hash2 + mod2 - path[idx] * RM2 % mod2) * base2 + path[idx + length]) % mod2
                hash = (hash1 << 32) | hash2

                if nil == cnt[hash] || (hashToPathNumber[hash] ?? -1) != pathIdx {
                    cnt[hash, default: 0 ] += 1
                    hashToPathNumber[hash] = pathIdx
                }
            }
        }
        return cnt.values.max() ?? 0 == pathsCnt
    }
    func longestCommonSubpath(_ n: Int, _ paths: [[Int]]) -> Int {
        self.paths = paths
        self.pathsCnt = paths.count
        var l = 0
        var r = Int.max
        for path in paths {
            r = min(r, path.count)
        }
       
        while l < r {
            let mid = (r + l + 1) >> 1
            if check(mid) {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return r
    }
    
     private func power(_ base: Int, _ length: Int,_ mod: Int) -> Int {
        var ans = 1
        var i = 0
        while i < length {
            ans = ans * base % mod
            i += 1
        }
        return ans
    }
}

