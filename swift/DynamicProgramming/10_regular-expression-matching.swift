// // https://leetcode.com/problems/regular-expression-matching/
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var memo = Array<Array<Bool?>>(repeating: Array<Bool?>(repeating: nil, count: p.count + 5), count: s.count + 5)
        func helper(_ sArr:[Character], _ pArr:[Character]) -> Bool {
            guard !sArr.isEmpty else {
                return isMatchEmptyArr(pArr)
            }
            guard !pArr.isEmpty else {
                return sArr.isEmpty
            }
            if let v = memo[sArr.count][pArr.count] {
                return v
            }
            var ans = false
            if pArr.count > 1 && pArr[1] == "*" {
                let nextP = [Character](pArr.dropFirst(2))
                ans = ans || helper(sArr, nextP)
                let length = pArr[0] == "." ? sArr.count : getLength(sArr, pArr[0])
                if length > 0 {
                    for l in 1...length {
                        ans = ans || helper([Character](sArr.dropFirst(l)), nextP)
                    }
                }
            } else {
                ans = ans || ((pArr[0] == "." || pArr[0] == sArr[0]) && helper([Character](sArr.dropFirst()), [Character](pArr.dropFirst())) )
            }
            memo[sArr.count][pArr.count] = ans
            return ans
        }
        
        
        return helper([Character](s), [Character](removeDuplicateStars(from: p)))
    }
    
    private func removeDuplicateStars(from pattern: String) -> String {
        var ans = ""
        for ch in pattern {
            if ch != "*" {
                ans.append(ch)
            } else {
                let lastCh = ans.last ?? "i"
                if lastCh != "*" {
                    ans.append("*")
                }
            }
        }
        return ans
    }
    
    
    private func getLength(_ sArr: [Character], _ ch: Character) -> Int {
        var i = 0
        let N = sArr.count
        
        while i < N && sArr[i] == ch {
            i += 1
        }
        return i
    }
    
    private  func isMatchEmptyArr(_ pArr: [Character]) -> Bool {
        guard !pArr.isEmpty else {return true}
        let N = pArr.count
        guard N & 1 == 0 else {return false}
        var i = 1
        while i < N {
            guard pArr[i] == "*" else {return false}
            i += 2
        }
        return true
    }
}