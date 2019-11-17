//https://leetcode.com/problems/synonymous-sentences/
extension Int {
    var reversedBinaryValue:  [Int]  {
        get {
            var ans = [Int]()
            var temp = self
            while temp > 0 {
                ans.append(temp & 1)
                temp >>= 1
            }
            return ans
        }
    }
}

class Solution {
    func generateSentences(_ synonyms: [[String]], _ text: String) -> [String] {
        var ans = [[String]]()
        let words = text.split(separator: " ").map{String($0)}
        ans.append(words)
        let wordLength = words.count
        for synonym in synonyms {
            let length = ans.count
            for i in 0..<length {
                var temp = ans[i]
                var indices = [Int]()
                for j in 0..<wordLength {
                    if temp[j] == synonym[0] || temp[j] == synonym[1] {
                        indices.append(j)
                    }
                }
                if indices.count == 1 {
                    temp[indices.first!] = temp[indices.first!]  == synonym[0] ? synonym[1] : synonym[0]
                    ans.append(temp)
                } else {
                    ans.append(contentsOf: allPermutation(indices, synonym, temp))
                }
                
            }
        }
        return ans.map{createSentences(by: $0)}.sorted()
    }
    private func createSentences(by words: [String]) -> String {
        var ans = ""
        for word in  words{
            ans += word + " "
        }
        ans.removeLast()
        return ans
    }
    //由于text的单词数最多为10，所以可以采用这种方法
    private func allPermutation(_ oriIndices: [Int],_ strs: [String], _ words : [String])  -> [[String]] {
        var ans = [[String]]()
        let count = Int(pow(2.0, Double(oriIndices.count)))
        for i in 1..<count {
            var tempWords = words
            var tempIndices = oriIndices
            for j in i.reversedBinaryValue {
                let index = tempIndices.removeFirst()
                if j == 1 {
                    tempWords[index] = tempWords[index] == strs[0] ? strs[1] : strs[0]
                }
            }
            ans.append(tempWords)
        }
        return ans
    }
}


