    // https://leetcode.cn/problems/minimum-operations-to-make-character-frequencies-equal/
    class Solution {
        func makeStringGood(_ s: String) -> Int {
            let N = s.count
            var cnt = [Int](repeating: 0, count: 26)
            for ch in s {
                cnt[Int(ch.asciiValue ?? 0) - 97] += 1
            }

            var memo = [String:Int]()
            func dfs(_ i:Int,_ expFreq:Int, _ preOps: Int) -> Int {
                guard i < 26 else {return 0}
                let key = "\(i)-\(expFreq)-\(preOps)"
                if let v = memo[key] {
                    return v
                }
                let curFre = cnt[i]
                if curFre == 0 || curFre == expFreq {
                    memo[key] = dfs(i + 1,expFreq,0)
                    return memo[key]!
                }
                //当前字符比较多，则删除一部分
                if curFre > expFreq {
                    memo[key] = (curFre - expFreq) + dfs(i + 1, expFreq, curFre - expFreq)
                    return memo[key]!
                }
                //利用上一个字符的名额
                if curFre + preOps >= expFreq {
                    memo[key] = dfs(i + 1, expFreq, 0)
                    return memo[key]!
                }
                memo[key] = min(curFre + dfs(i + 1, expFreq, curFre),(expFreq - (curFre + preOps)) + dfs(i + 1, expFreq, 0))
                return memo[key]!
            }


            var sb = Int.max
            for l in 0...cnt.max()! {
                let curRes = dfs(0,l,0)
                if curRes < sb {
                    sb = curRes
                }
                memo = [:]
            }
            return sb
        }
    }
