// https://leetcode.com/problems/maximum-score-from-removing-substrings/
class Solution {
    private typealias SubstrAndStore = (str:String,score:Int)
    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        let sortedSubstrAndScores: [SubstrAndStore] = [("ab",x),("ba",y)].sorted {$0.score > $1.score }
        var ans = 0
        var str = s
        for i in 0..<2 {
            let rel = delete(sortedSubstrAndScores[i].str, from: str, sortedSubstrAndScores[i].score)
            ans += rel.score
            str = rel.remainStr
        }
        return ans
    }
    
    private func delete(_ substr: String, from sourceStr: String, _ score: Int) -> (score:Int,remainStr: String){
        var remainStr = ""
        let secondChar = substr.last!
        let firstChar = substr.first!
        for ch in sourceStr {
            if ch == secondChar && !remainStr.isEmpty && remainStr.last! == firstChar {
                remainStr.removeLast()
            } else {
                remainStr.append(ch)
            }
        }
        return (((sourceStr.count - remainStr.count) >> 1 ) * score, remainStr)
    }
}
class Solution1 {
    private typealias SubstrAndStore = (str:String,score:Int)
    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        let sortedSubstrAndScores: [SubstrAndStore] = [("ab",x),("ba",y)].sorted {$0.score > $1.score }
        var ans = 0
        var str = s
        for i in 0..<2 {
            let rel = delete(sortedSubstrAndScores[i].str, from: str, sortedSubstrAndScores[i].score)
            ans += rel.score
            str = rel.remainStr
        }
        return ans
    }
    
    private func delete(_ substr: String, from sourceStr: String, _ score: Int) -> (score:Int,remainStr: String){
        var remainStr = ""
        for ch in sourceStr {
            remainStr.append(ch)
            if remainStr.hasSuffix(substr) {
                remainStr.removeLast(substr.count)
            }
        }
        return (((sourceStr.count - remainStr.count) >> 1 ) * score, remainStr)
    }
}

