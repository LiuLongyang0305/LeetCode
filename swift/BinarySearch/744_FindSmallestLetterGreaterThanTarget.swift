//https://leetcode.com/problems/find-smallest-letter-greater-than-target/ 
class Solution {
    
     func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        
        let chars = Set<Character>(letters).sorted()
        guard chars.count >  1 else {
            return chars.first!
        }
        if target >= chars.last! || target < chars.first! {
            return chars.first!
        }
        for i in 0..<(chars.count - 1) {
            if target >= chars[i]  && target < chars[i + 1] {
                return chars[i + 1]
            }
        }
         return " "
     }
 }

  class Solution {
    
     func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var chars = Array<Bool>(repeating: false, count: 26)
        var  map  = [Int:Character]()
        for ch in Set<Character>(letters) {
            let index = Int(ch.asciiValue! -  Character("a").asciiValue!)
            chars[index] = true
            map[index] = ch
        }
        chars.append(contentsOf: chars)
        var index = Int(target.asciiValue! - Character("a").asciiValue!) + 1
        while index < chars.count {
            if chars[index] {
                return map[index % 26]!
            }
            index += 1
        }
         return " "
     }
 }