// https://leetcode.com/problems/sentence-screen-fitting/
class Solution {
    private typealias CycleResult = (times:Int,usedRows: Int)
    func wordsTyping(_ sentence: [String], _ rows: Int, _ cols: Int) -> Int {
        let wordsLength = sentence.map {$0.count}
        // guard wordsLength.max()! <= cols else {
        //     return 0
        // }
        let cycle = getCycle(sentence, wordsLength, cols, rows)
        guard cycle.usedRows != -1  else {
            return cycle.times
        }
        
        return (rows / cycle.usedRows) * cycle.times + getCycle(sentence, wordsLength, cols, rows % cycle.usedRows).times
    }
    
    private func getCycle(_ sentence: [String], _ wordsLength: [Int], _ cols: Int, _ rows: Int) -> CycleResult {
        var ans: CycleResult = (0,-1)
        var row = 0
        var wordIdx = 0
        let wordsLength = sentence.map { $0.count}
        var rowleft = cols
        while row < rows {
            let wordLength = wordsLength[wordIdx]
            if rowleft >= wordLength {
                rowleft -= wordLength
                rowleft -= 1//空格
                wordIdx += 1
                if wordIdx == sentence.count {
                    ans.times += 1
                    wordIdx = 0
                }
            } else {
                row += 1
                if wordIdx == 0 {
                    ans.usedRows = row
                    return ans
                }
                rowleft = cols
                
            }
        }
        return ans
        
    }
}