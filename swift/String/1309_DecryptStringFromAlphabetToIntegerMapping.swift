//  https://leetcode.com/problems/decrypt-string-from-alphabet-to-integer-mapping/
class Solution1 {
    private let chars = Array<Character>(" abcdefghijklmnopqrstuvwxyz")
    func freqAlphabets(_ s: String) -> String {
        var ans = ""
        var sCopy = s
        while !sCopy.isEmpty {
            if let index = sCopy.firstIndex(of: "#"), sCopy.distance(from: sCopy.startIndex, to: index) == 2 {
                let indexStr = String(sCopy[sCopy.startIndex...sCopy.index(after: sCopy.startIndex) ])
                sCopy.removeFirst(3)
                ans.append(chars[Int(indexStr)!])
            } else {
                ans.append(chars[Int("\(sCopy.removeFirst())")!])
            }
            
        }
        return ans
    }
 }
 class Solution11 {
    private let chars = Array<Character>(" abcdefghijklmnopqrstuvwxyz")
    func freqAlphabets(_ s: String) -> String {
        var ans = ""
        var index = s.startIndex
        
        while index < s.endIndex {
            if s.distance(from: index, to: s.endIndex) > 2 && s[s.index(index, offsetBy: 2)] == "#"{
                ans.append(chars[Int(String(s[index...s.index(after: index)]))!])
                index = s.index(index, offsetBy: 2)
            } else {
                ans.append(chars[Int("\(s[index])")!])
                index = s.index(after: index)
            }
            
        }
        return ans
    }
 }

 extension UInt8 {
     var ASCII: Character {
         get {
             return Character(Unicode.Scalar(self))
         }
     }
  }
 class Solution {
     func freqAlphabets(_ s: String) -> String {
         var ans = ""
         let sChars = [Character](s)
         var index = 0
         while index < s.count {
             if index + 2 < s.count && sChars[index + 2] == "#" {
                 ans.append(((sChars[index].asciiValue! - 48) * 10 + sChars[index + 1].asciiValue! - 48 + 96).ASCII )
                 index += 3
             } else {
                 ans.append((sChars[index].asciiValue! - 48 + 96).ASCII)
                 index += 1
             }
         }
         return ans
     }
  }



