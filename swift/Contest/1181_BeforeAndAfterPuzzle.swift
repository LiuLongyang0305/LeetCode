class Solution {
    func beforeAndAfterPuzzles(_ phrases: [String]) -> [String] {
        var ans = Set<String>()
        let seperator = CharacterSet.init(charactersIn: " ")
        typealias indices = (start:[Int],end:[Int])
        var commonWordsIndices = [String:indices]()
        let phrasesCompoments = phrases.map { (str) -> [String] in
            return str.components(separatedBy: seperator)
        }
        for i in 0..<phrasesCompoments.count {
            let startWith = phrasesCompoments[i][0]
            let endWith  = phrasesCompoments[i].last!
            if commonWordsIndices[startWith] == nil {
                commonWordsIndices[startWith] = ([Int](),[Int]())
            }
            if commonWordsIndices[endWith] == nil {
                commonWordsIndices[endWith] = ([Int](),[Int]())
            }
            commonWordsIndices[startWith]?.start.append(i)
            commonWordsIndices[endWith]?.end.append(i)
        }
        for (_,val) in commonWordsIndices {
            let startIndices = val.start
            let endIndices = val.end
            if val.start.isEmpty || val.end.isEmpty {
                continue
            }
            if startIndices.count == 1 && startIndices == endIndices {
                continue
            }
            for start in startIndices {
                for end in endIndices {
                    if start != end {
                        var tempAns = ""
                        for  str in phrasesCompoments[end] {
                            tempAns +=  (str + " ")
                        }
                        let endCompoments = phrasesCompoments[start]
                        let  length  = endCompoments.count
                        if length > 1 {
                            for i in 1..<length{
                                let str = endCompoments[i] + ( i == length - 1 ? "" : " ")
                                tempAns += str
                            }
                        } else {
                            tempAns.removeLast()
                        }
                        ans.insert(tempAns)
                    }
                }
            }
        }
        return ans.sorted()
    }
}