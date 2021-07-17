// https://leetcode.com/problems/alien-dictionary/
class Solution {
    func alienOrder(_ words: [String]) -> String {
        
        
        
        var cnt = 0
        var inDegree = [Character:Int]()
        var graph = [Character:[Character]]()
        let N = words.count
        let wordsToChars = words.map { [Character]($0)}
        let wordsLength = words.map {$0.count}
        
        //["abc","ab"]
        var wordIdx = 0
        while wordIdx < N {
            let next = wordIdx + 1
            if next < N {
                if wordsLength[next] < wordsLength[wordIdx] {
                    guard !words[wordIdx].hasPrefix(words[next]) else {
                        return ""
                    }
                }
            }
            wordIdx += 1
        }
        
        func innitGraph() {
            for word in words {
                for ch in word {
                    if nil == inDegree[ch] {
                        cnt += 1
                        inDegree[ch] = 0
                    }
                }
            }
            
            var first = 0
            while first < N {
                let second = first + 1
                if second < N {
                    let minLength = min(wordsLength[first], wordsLength[second])
                    for i in 0..<minLength {
                        let from = wordsToChars[first][i]
                        let to = wordsToChars[second][i]
                        if from != to {
                            graph[from, default: []].append(to)
                            inDegree[to,default: 0 ] += 1
                            break
                        }
                    }
                }
                first += 1
            }
        }
        func topologySort() -> String{
            var ans = ""
            var queue = [Character]()
            for (ch,id) in inDegree {
                if id == 0 {
                    queue.append(ch)
                    ans.append(ch)
                }
            }
            while !queue.isEmpty {
                var newLevel = [Character]()
                for ch in queue {
                    guard let to = graph[ch] else {
                        continue
                    }
                    for next in to {
                        if let id = inDegree[next] {
                            if id == 1 {
                                newLevel.append(next)
                                inDegree.removeValue(forKey: next)
                                ans.append(next)
                            } else {
                                inDegree[next] = id - 1
                            }
                        }
                    }
                }
                queue = newLevel
            }
            return ans.count == cnt ? ans : ""
        }
        innitGraph()
        return topologySort()
    }
}

