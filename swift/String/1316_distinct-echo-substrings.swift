// https://leetcode.com/problems/distinct-echo-substrings/
class Solution {
    
    private let BASE = 31
    private let MOD = 1_000_000_007
    
    func distinctEchoSubstrings(_ text: String) -> Int {
        
        let N = text.count
        let chars = [Character](text)
        var hash = Array<Int>(repeating: 0, count: N + 1)
        var pow = Array<Int>(repeating: 1, count: N + 1)
        for i in 1...N {
            hash[i] = (hash[i - 1] * BASE + Int(chars[i - 1].asciiValue!) - 97) % MOD
            pow[i] = pow[i - 1] * BASE % MOD
        }
        
        func getHash(_ left: Int, _ right: Int, _ l: Int) -> Int {
            
            return (hash[right + 1] - hash[left] * pow[l] % MOD + MOD) % MOD
        }
        
        var ans = 0
        var length = 2
        while length <= N {
            let half = length >> 1
            var visited = Set<Int>()
            var idx = 0
            while idx < N {
                //idx ... mid
                let mid = idx + half - 1
                // mid + 1 ... right
                let right = mid  + half
                guard right < N else {
                    break
                }
                let h1 = getHash(idx, mid, half)
                if !visited.contains(h1) {
                    let h2 = getHash(mid + 1, right, half)
                    if h1 == h2 {
                        visited.insert(h1)
                    }
                }
                idx += 1
            }
            ans += visited.count
            length += 2
        }
        return ans
    }
}


