//https://leetcode.com/problems/keyboard-row/
let charToNumOfRow: Dictionary<Character,Int> = ["q":0,"w":0,"e":0,"r":0,"t":0,"y":0,"u":0,"i":0,"o":0,"p":0,
                                                 "a":1,"s":1,"d":1,"f":1,"g":1,"h":1,"j":1,"k":1,"l":1,
                                                 "z":2,"x":2,"c":2,"v":2,"b":2,"n":2,"m": 2]
class Solution {
    func findWords(_ words: [String]) -> [String] {
        var  ans = [String]()
        guard !words.isEmpty else {
            return ans
        }
        for word in words {
            if valid(word: word) {
                ans.append(word)
            }
        }
        return ans
    }
    
    private func valid(word: String) -> Bool {
        let wordLowercased  = word.lowercased()
        let numOfRow = charToNumOfRow[wordLowercased.first!]
        for ch in wordLowercased {
            if charToNumOfRow[ch]! != numOfRow {
                return false
            }
        }

        return true
    }
}

