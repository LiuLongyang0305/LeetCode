// https://leetcode.com/problems/word-abbreviation/
class Solution {
    func wordsAbbreviation(_ words: [String]) -> [String] {

        var abbrToWord = getAbbreviations(of: words)
        var preffixLength = 1

        //单词和缩写一一对应作为结束判断条件

        while abbrToWord.count < words.count {
            preffixLength += 1

            var newAbbrToWord = abbrToWord

            for (abbr,ws) in abbrToWord {
                guard ws.count > 1 else {
                    continue
                }
                // 当缩写与单词不是一一对应关系，则增加前缀长度
                let wsArr = [String](ws)
                newAbbrToWord.removeValue(forKey: abbr)
                for (k,v) in getAbbreviations(of: wsArr, preffixLength) {
                    newAbbrToWord[k] = v
                }

            }
            // 更新单词和缩写的对应字典
            abbrToWord = newAbbrToWord

        }
        // 构造答案
        var mapWordToIndex = [String:Int]()
        (0..<words.count).forEach { mapWordToIndex[words[$0]] = $0}
        var ans = Array<String>(repeating: "", count: words.count)
        for (abbr,ws) in abbrToWord {
            ans[mapWordToIndex[ws[0]] ?? -1] = abbr
        }
        return ans
    }
    
    private func getAbbreviations(of words: [String],_ preffixLength: Int = 1) -> [String:[String]] {
        var ans = [String:[String]]()
        for word in words {
            var abbr = String(word.prefix(preffixLength)) + "\(word.count - preffixLength - 1)\(word.last!)"
            if abbr.count >= word.count {
                abbr = word
            }
            ans[abbr,default: [] ].append(word)
        }
        return ans
    }
}
