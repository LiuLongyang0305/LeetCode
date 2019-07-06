class Q383_Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var ransomNoteCounts : Dictionary<Character,Int> = Dictionary<Character,Int>()
        for char in ransomNote {
            if nil == ransomNoteCounts[char] {
                ransomNoteCounts[char] = 1
            } else {
                ransomNoteCounts[char]  = ransomNoteCounts[char]! + 1
            }
        }
        for char in magazine {
            if nil != ransomNoteCounts[char] {
                ransomNoteCounts[char] =  ransomNoteCounts[char]! - 1
                if 0 == ransomNoteCounts[char]! {
                    ransomNoteCounts.removeValue(forKey: char)
                }
                if ransomNoteCounts.isEmpty {
                    return true
                }
            }
        }
        return ransomNoteCounts.isEmpty
    }
}