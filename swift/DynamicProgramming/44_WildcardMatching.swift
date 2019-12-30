//https://leetcode.com/problems/wildcard-matching/
 class Solution1 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        guard !s.isEmpty else {
            return p.isEmpty || Set<Character>(p) == ["*"]
        }
        guard !p.isEmpty else {
            return s.isEmpty
        }
        let pattern = simplifyPattern(pattern: p)
        let M = s.count
        let N = pattern.count
        guard M != 0 || N != 0 else {
            return  true
        }
        let  patternChars = [Character](pattern)
        let sourceChars = [Character](s)
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N + 1), count: M + 1)
        dp[0][0] = true
        if patternChars[0] == "*" {
            dp[0][1] = true
        }
        for r in 1...M {
            for c in 1...N {
                if patternChars[c - 1] == "?" || patternChars[c - 1] == sourceChars[r - 1] {
                    dp[r][c] = dp[r - 1][c - 1]
                } else if patternChars[c - 1] == "*" {
                    dp[r][c] = dp[r - 1][c] || dp[r][c  - 1]
                }
            }
        }
        return dp[M][N]
    }
    private func simplifyPattern(pattern: String) -> String {
        var tempPattern = ""
        var last: Character = " "
        for ch in pattern {
            if ch == "*" && ch == last {
                continue
            }
            last = ch
            tempPattern.append(ch)
        }
        return tempPattern
    }
 }
 

 class Solution {
     func isMatch(_ s: String, _ p: String) -> Bool {
         if p.isEmpty { return s.isEmpty }

         let sArr = Array(s)
         //let pArr = removeDups(p)
         let pArr = Array(p)
         let sCount = sArr.count
         let pCount = pArr.count

         var sIndex = 0 // keep track of current pos in s
         var pIndex = 0 // keep track of current pos in p
         var starIndex = -1 // keep track of latest * index
         var sTempIndex = -1 // keep track of last s pos where * is encountered

         while sIndex < sCount {
             if pIndex < pCount && (sArr[sIndex] == pArr[pIndex] || pArr[pIndex] == "?") {
                 sIndex += 1
                 pIndex += 1
             } else if pIndex < pCount && pArr[pIndex] == "*" {
                 // handle the case where * is matching 0 char
                 starIndex = pIndex
                 sTempIndex = sIndex
                 pIndex += 1
             } else if starIndex == -1 { // no star in the pattern, so if the char's not matching, we know the whole thing doesn't match
                 return false
             } else { // there's a star in pattern, we can backtrack and see if the * is matching 1 or more chars
                 sIndex = sTempIndex + 1
                 pIndex = starIndex + 1
                 sTempIndex = sIndex
             }
         }

         if pIndex < pCount {
             for i in pIndex..<pCount where pArr[i] != "*" {
                 return false
             }
         }
         return true
     }

     private func removeDups(_ p: String) -> [Character] {
         var res = [Character]()
         res.append(p[p.startIndex]) // we know that p can't be empty
         var prev = res[0]

         for i in 1..<p.count {
             let index = p.index(p.startIndex, offsetBy: i)
             let char = p[index]
             if char == "*" && prev == char {
                 continue
             } else {
                 res.append(char)
                 prev = char
             }
         }
         return res
     }
 }
