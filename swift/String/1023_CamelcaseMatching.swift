//https://leetcode.com/problems/camelcase-matching/
class Solution {
    typealias DevideStringResults = (uppercaseLetters: [Character], parts: [String] )
    
    var patternUppercaseLetters = [Character]()
    var patternPartsArray = [[Character]]()
    
    func camelMatch(_ queries: [String], _ pattern: String) -> [Bool] {
        
        let devidePatternResults = devide(str: pattern)
        self.patternUppercaseLetters = devidePatternResults.uppercaseLetters
        self.patternPartsArray = devidePatternResults.parts.map({ (str) -> [Character] in
            Array<Character>(str)
        })
        
        var ans = Array<Bool>(repeating: false, count: queries.count)
        for i in 0..<queries.count {
            if match(str: queries[i]) {
                ans[i] = true
            }
        }
        
        return ans
    }
    
    private  func devide(str: String) -> DevideStringResults {
        var currentUpercaseLetters = [Character]()
        var strParts = [String]()
        var current = ""
        for ch in str {
            if ch.isUppercase {
                if !current.isEmpty {
                    strParts.append(current)
                }
                currentUpercaseLetters.append(ch)
                current = ""
                current.append(ch)
                continue
            }
            if !current.isEmpty {
                current.append(ch)
            }
        }
        if !current.isEmpty {
            strParts.append(current)
        }
        return (currentUpercaseLetters,strParts)
    }
    
    
    private func match(str: String) -> Bool {
        let devideResults = devide(str: str)
        if devideResults.uppercaseLetters != patternUppercaseLetters {
            return false
        }
        let parts = devideResults.parts
        for i in 0..<parts.count {
            let source = Array<Character>(parts[i])
            let target = patternPartsArray[i]
            if source.count < target.count {
                return false
            }
            var i = 1
            var j = 1
            
            while i < source.count && j < target.count {
                if source[i] == target[j] {
                    j += 1
                }
                i += 1
            }
            if j != target.count {
                return false
            }
        }
        return true
    }
}

let queries = ["uAxaqlzahfialcezsLfj","cAqlzyahaslccezssLfj","AqlezahjarflcezshLfj","AqlzofahaplcejuzsLfj","tAqlzahavslcezsLwzfj","AqlzahalcerrzsLpfonj","AqlzahalceaczdsosLfj","eAqlzbxahalcezelsLfj"]
let pattern = "AqlzahalcezsLfj"
Solution().camelMatch(queries, pattern)



