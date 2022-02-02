// https://leetcode.com/problems/minimum-cost-to-separate-sentence-into-rows/
class Solution {
    func minimumCost(_ sentence: String, _ k: Int) -> Int {
        guard sentence.count > k else {return 0}
        let words = sentence.split(separator: " ").map { String($0)}
        let N = words.count
        
        func dfs(_ wordIdx: Int,_ curLineCharsCnt: Int, _ lineNumber: Int) -> Int {
            guard wordIdx < N else {return 0}
            //当前单词另起一行，则加入上一行的成本
            var ans = (k - curLineCharsCnt) * (k - curLineCharsCnt) + dfs(wordIdx + 1, words[wordIdx].count, lineNumber + 1)
            //如果当前单词可以加入上一行，则可以选择加入上一行
            let M = words[wordIdx].count + 1 +  curLineCharsCnt
            if M  <= k {
                ans = min(dfs(wordIdx + 1, M, lineNumber),ans)
            }
            return ans
        }
        return dfs(1, words[0].count, 1)
    }
}