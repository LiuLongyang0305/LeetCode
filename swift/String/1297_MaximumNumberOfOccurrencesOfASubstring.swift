//https://leetcode.com/problems/maximum-number-of-occurrences-of-a-substring/
 class Solution1 {
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        
        let sourceChars = [Character](s)
        var substrsCount = [String:Int]()
        var subStr = String(sourceChars[0..<minSize])
        var charsCounter = [Character:Int]()
        
        for i in 0..<minSize {
            charsCounter.updateValue((charsCounter[sourceChars[i]] ?? 0) + 1, forKey: sourceChars[i])
        }
        for i  in minSize..<s.count {
            if charsCounter.count <= maxLetters {
                substrsCount.updateValue((substrsCount[subStr] ?? 0 ) + 1, forKey: subStr)
            }
            let ch = subStr.removeFirst()
            subStr.append(sourceChars[i])
            if  ch != sourceChars[i] {
                if let c = charsCounter[ch] {
                    if c == 1 {
                        charsCounter.removeValue(forKey: ch)
                    } else {
                        charsCounter.updateValue(c - 1, forKey: ch)
                    }
                }
                charsCounter.updateValue((charsCounter[sourceChars[i]] ??  0) + 1, forKey: sourceChars[i])
            }
        }
        
        if charsCounter.count <= maxLetters {
            substrsCount.updateValue((substrsCount[subStr] ?? 0 ) + 1, forKey: subStr)
        }
        return substrsCount.values.max() ?? 0
    }
 }
 
 class Solution {
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        
        var substrsCount = [String:Int]()
        var subStr = ""
        var charsCounter = [Character:Int]()
        for ch in s {
            subStr.append(ch)
            charsCounter.updateValue(1 + (charsCounter[ch] ?? 0), forKey: ch)
            
            if subStr.count == minSize {
                if charsCounter.count <= maxLetters {
                    substrsCount.updateValue(1 + (substrsCount[subStr]  ?? 0), forKey: subStr)
                }
                let ch = subStr.removeFirst()
                if let c = charsCounter[ch] {
                    if c == 1 {
                        charsCounter.removeValue(forKey: ch)
                    } else {
                        charsCounter.updateValue(c - 1, forKey: ch)
                    }
                }
            }
        }
        
        return substrsCount.values.max() ?? 0
    }
 }
 let a =  "abcde"
 print(Solution().maxFreq(a, 2, 3, 3))
