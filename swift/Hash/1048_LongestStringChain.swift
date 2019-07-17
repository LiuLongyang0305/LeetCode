//https://leetcode.com/problems/longest-string-chain/
typealias Counter = Dictionary<Character,Int>
typealias LengthToWords = Dictionary<Int,[Counter]>
class Solution {
    func longestStrChain(_ words: [String]) -> Int {
        var  ans = 0
        var  lengthToWords = LengthToWords()
        for word in words {
            let count  = word.count
            if nil == lengthToWords[count] {
                lengthToWords[count] = [countChars(word)]
            } else {
                lengthToWords[count]?.append(countChars(word))
            }
        }
        var visited = Set<Counter>()
        func traverse(length: Int, counter: Counter?,minLength: Int,isNewStart: Bool) {
            if let tempWords = lengthToWords[length] {
                for temp in tempWords {
                    if isNewStart {
                        let  chainLength =  1
                        if chainLength > ans {
                            ans = chainLength
                        }
                        visited.insert(temp)
                        traverse(length: length + 1, counter: temp, minLength: minLength,isNewStart: false)
                        continue
                    }
                    
                    if compareCounter(first: counter!, second: temp) {
                        let  chainLength = length - minLength + 1
                        if chainLength > ans {
                            ans = chainLength
                        }
                        visited.insert(temp)
                        traverse(length: length + 1, counter: temp,minLength: minLength,isNewStart: false)
                    }
                }
            }
        }
        //maybe this chain will be start with any word in the list
        for length in Array<Int>(lengthToWords.keys) {
            let counters = lengthToWords[length]!
            for counter in counters {
                if !visited.contains(counter) {
                    traverse(length: length,counter: nil,minLength: length,isNewStart: true)
                }
            }
        }
        
        return ans
    }
    
    private func countChars(_ word: String) -> Counter {
        var counter = Counter()
        for ch in word {
            if let count = counter[ch] {
                counter[ch] = count + 1
            } else {
                counter[ch] = 1
            }
        }
        return counter
    }
    
    private func compareCounter(first: Counter, second: Counter) -> Bool {
        var secondCopy = second
        for (ch,val) in first {
            if second[ch] == nil {
                return false
            } else {
                secondCopy[ch] = secondCopy[ch]!  - val
                if secondCopy[ch] == 0 {
                    secondCopy.removeValue(forKey: ch)
                }
            }
        }
        if secondCopy.keys.count != 1 {
            return false
        }
        return secondCopy.first!.value == 1
    }
}

var words = ["ksqvsyq","ks","kss","czvh","zczpzvdhx","zczpzvh","zczpzvhx","zcpzvh","zczvh","gr","grukmj","ksqvsq","gruj","kssq","ksqsq","grukkmj","grukj","zczpzfvdhx","gru"]
Solution().longestStrChain(words)
