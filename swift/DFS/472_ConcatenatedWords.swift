  //https://leetcode.com/problems/concatenated-words/
  class Solution {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        
        guard words.count > 2 else {
            return []
        }
        
        var ans = [String]()
        var map = [Int: Set<String>]()
        
        for word in words {
            if !word.isEmpty {
                if nil == map[word.count] {
                    map[word.count] = []
                }
                map[word.count]?.insert(word)
            }
        }
        
        let minWordLength = map.keys.min()!
        let maxWordLength = map.keys.max()!
        let targetLength = minWordLength << 1
        
        func dfs(_ totalCount: Int, word: [Character]) -> Bool {
            //无法继续拆分也可定不包含在给定单词列表中
            guard word.count >= minWordLength else {
                return false
            }
            //可能满足要求直接返回
            if word.count >= minWordLength && word.count <= maxWordLength {
                if let strs = map[word.count] {
                    if strs.contains(String(word)) && totalCount != 0 {
                        return true
                    }
                }
            }
            //需要保证能够拆分为两个单词，所以长度至少为 2 * minWordLength
            guard word.count >= targetLength else {
                return false
            }
            
            //前缀可能长度：minWordLength ---> maxWordLength
            var length = minWordLength
            while length <= min(maxWordLength, word.count) {
                //保证除去前缀剩下的部分的最短长度为minWordLength
                if  word.count - length < minWordLength {
                    break
                }
                let left = String(word[0..<length])
                if let strs = map[length], strs.contains(left) {
                    var temp = word
                    temp.removeFirst(length)
                    if dfs(totalCount + 1, word: temp) {
                        return true
                    }
                }
                length += 1
            }
            return false
        }
        
        for index in 0..<words.count {
            if words[index].count >= targetLength && dfs(0, word: [Character](words[index])) {
                ans.append(words[index])
            }
        }
        
        return ans
    }
 }
 
 

