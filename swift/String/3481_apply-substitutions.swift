//https://leetcode.cn/problems/apply-substitutions/
import RegexBuilder
class Solution {
    func applySubstitutions(_ replacements: [[String]], _ text: String) -> String {
        let  pattern = Regex{
            "%"
            CharacterClass("A"..."Z")
            "%"
        }

        var map = [Character:String]()
        func solve(_ str: String) -> String? {
            var sb = str
            while let firstMatch = sb.firstMatch(of: pattern) {
                let key = sb[sb.index(after: firstMatch.startIndex)]
                if let v = map[key] {
                    sb.replaceSubrange(firstMatch.range,with: map[key]!)
                } else {
                    return nil
                }
            }
            return sb
        }
        var needHanddleAgain = [(Character,String)]()
        for r in replacements {
            let (k,v) = (r[0],r[1])
            if let _ = v.firstMatch(of: pattern) {
                needHanddleAgain.append((k.first!,v))
            } else {
                map[k.first!] = v
            }
        }





        while !needHanddleAgain.isEmpty {
            var newLevel = [(Character,String)]()
            for (k,v) in needHanddleAgain {
                if let str = solve(v) {
                    map[k] = solve(v)
                } else {
                    newLevel.append((k,v))
                }
            }
            needHanddleAgain = newLevel
        }
        return solve(text)!
    }
}
