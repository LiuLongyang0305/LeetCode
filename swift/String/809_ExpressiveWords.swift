//https://leetcode.com/problems/expressive-words/
class Solution {
    
    typealias CharCounter = (char:Character, count: Int)
    typealias StringCounter = [CharCounter]
    
    var sourceCounter = StringCounter()
    
    func expressiveWords(_ S: String, _ words: [String]) -> Int {
        sourceCounter = counter(S)
        var  ans = 0
        for word in words {
            if match(word) {
                ans += 1
            }
        }
        return ans
    }
    
    private  func counter(_ str: String) -> StringCounter {
        var counter = StringCounter()
        for ele in str {
            if counter.isEmpty || ele != counter.last!.char {
                counter.append((ele,1))
                continue
            }
            counter[counter.count - 1].count += 1
        }
        return counter
    }
    
    private func match(_ str: String) -> Bool {
        
        let tempCounter = counter(str)
        
        if tempCounter.count != sourceCounter.count {
            return false
        }

        for i in 0..<tempCounter.count {
            let temp = tempCounter[i]
            let source = sourceCounter[i]
            if  temp.char != source.char {
                return false
            }
            let sub = source.count - temp.count
            if sub < 0 || (sub != 0 && source.count == 2) {
                return false
            }
        }
        return true
    }
}

let s = "dddiiiinnssssssoooo"
let words = ["dinnssoo","ddinso","ddiinnso","ddiinnssoo","ddiinso","dinsoo","ddiinsso","dinssoo","dinso"]

Solution().expressiveWords(s, words)


