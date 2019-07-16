//https://leetcode.com/problems/shortest-completing-word/

typealias Counter = Dictionary<Character,Int>
class Solution {
    func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
        var ans = ""
        var licensePlateCounter = Counter()
        let licensePlateLetters = licensePlate.lowercased().filter({ (ch) -> Bool in
            ch.isLetter
        })
        let licensePlateSet = Set<Character>(licensePlateLetters)
        for ch in licensePlateLetters {
            if let num = licensePlateCounter[ch] {
                licensePlateCounter[ch] = num + 1
            } else {
                licensePlateCounter[ch] = 1
            }
        }
        func isCompleteWord(_ word: String) -> Bool {
            var currentCounter = Counter()
            for ch in word.lowercased() {
                if licensePlateSet.contains(ch){
                    if let num = currentCounter[ch] {
                        currentCounter[ch] = num + 1
                    } else {
                        currentCounter[ch] = 1
                    }
                }
            }
            for ch in licensePlateSet {
                if let num = currentCounter[ch] {
                    if num < licensePlateCounter[ch]! {
                        return false
                    }
                } else {
                    return false
                }
            }
            return true
        }
        
        for word in words {
            if isCompleteWord(word) {
                if ans.isEmpty {
                    ans = word
                } else {
                    if word.count < ans.count {
                        ans = word
                    }
                }
            }
        }
        return ans
    }
}

var  license = "GrC8950"
var  words = ["measure","other","every","base","according","level","meeting","none","marriage","rest"]
Solution().shortestCompletingWord(license, words)
