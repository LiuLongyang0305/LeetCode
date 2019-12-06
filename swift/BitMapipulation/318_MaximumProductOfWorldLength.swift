// https://leetcode.com/problems/maximum-product-of-word-lengths/
 //Accepted
 class Solution1 {
    func maxProduct(_ words: [String]) -> Int {
        var map = [Set<Character>:Int]()
        for word in words {
            let set = Set<Character>(word)
            if let maxLength  = map[set] {
                if maxLength < word.count {
                    map.updateValue(word.count, forKey: set)
                }
            } else {
                map.updateValue(word.count, forKey: set)
            }
        }
        guard map.count >= 2 else {
            return 0
        }
        let sortedMap = map.sorted { (dic1, dic2) -> Bool in
            dic1.value > dic2.value
        }
        var ans = 0
        for i in 0..<(sortedMap.count - 1) {
            for j in (i + 1)..<sortedMap.count {
                if  sortedMap[i].key.intersection(sortedMap[j].key).isEmpty {
                    ans = max(ans, sortedMap[i].value * sortedMap[j].value)
                }
            }
        }
        return ans
    }
 }
 
 let aAsciValue = Character("a").asciiValue!
 extension String  {
    var toValue: Int32 {
        var ans: Int32 =  0
        for ch in self {
            ans |= 1 << (Int(ch.asciiValue! - aAsciValue))
        }
        return ans
    }
 }
 class Solution2 {
    func maxProduct(_ words: [String]) -> Int {
        guard words.count > 1 else {
            return 0
        }
        let values = words.map{$0.toValue}
        var ans =  0
        for i in 0..<(words.count - 1) {
            for j in (i + 1)..<words.count {
                if values[i] & values[j] == 0 {
                    ans = max(ans, words[i].count * words[j].count)
                }
            }
        }
        return ans
    }
 }
 //TLE
 class Solution {
    func maxProduct(_ words: [String]) -> Int {
        guard words.count > 1 else {
            return 0
        }
        let charsSets = words.map{Set<Character>($0)}
        var ans =  0
        for i in 0..<(words.count - 1) {
            for j in (i + 1)..<words.count {
                if charsSets[i].intersection(charsSets[j]).isEmpty {
                    ans = max(ans, words[i].count * words[j].count)
                }
            }
        }
        return ans
    }
 }
