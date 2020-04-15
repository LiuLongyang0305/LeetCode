// https://leetcode.com/problems/factor-combinations/
class Solution {
   private static var memo = [Int:[[Int]]]()
    func getFactors(_ n: Int) -> [[Int]] {
        guard n > 3  else {
            return []
        }
       guard nil == Solution.memo[n] else {
           return Solution.memo[n]!
       }
        var ans = Set<[Int]>()
        var i = 2
        while i * i <= n {
            if n % i == 0 {
                
                var left = getFactors(i)
                left.append([i])
                var right = getFactors(n / i)
                right.append([n / i])
                for l in left {
                    for r in right {
                        var currentAns = l
                        currentAns.append(contentsOf: r)
                        currentAns.sort()
                        ans.insert(currentAns)
                    }
                }
            }
            i += 1
        }
        let fibalAns = [[Int]](ans)
       Solution.memo[n] = fibalAns
        return fibalAns
        
    }
}



