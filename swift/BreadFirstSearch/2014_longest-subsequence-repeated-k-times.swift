//  https://leetcode.com/problems/longest-subsequence-repeated-k-times/
extension String {
    var counter: [Character:Int] {
        var ans = [Character:Int]()
        self.forEach { ans[$0,default: 0 ] += 1}
        return ans
    }
}
class Solution {
    func longestSubsequenceRepeatedK(_ s: String, _ k: Int) -> String {
        
        
        //获取可以出现在子序列当中的字符
        let counter = s.counter
        var candidateChars = Set<Character>()
        for (ch,cnt) in counter {
            if cnt >= k {
                candidateChars.insert(ch)
            }
        }
        //获取可以出现字符的全集
        var sourceChars = [Character]()
        for ch in s {
            if candidateChars.contains(ch) {
                sourceChars.append(ch)
            }
        }
        
        let N = sourceChars.count
        
        func check(_ subsequence: [Character]) -> Bool {
            
            var cnt = 0
            let M = subsequence.count
            
            var sourceIdx = 0
            var targetIdx = 0
            
            while sourceIdx < N {
                while sourceIdx < N && targetIdx < M {
                    if sourceChars[sourceIdx] == subsequence[targetIdx] {
                        sourceIdx += 1
                        targetIdx += 1
                    } else {
                        sourceIdx += 1
                    }
                }
                if targetIdx == M {
                    cnt += 1
                    targetIdx = 0
                }
                guard cnt < k else {
                    break
                }
            }
            return cnt == k
        }
        
        let sortedCandidateChars = candidateChars.sorted()
        let maxNumbersOfEachChar = sortedCandidateChars.map { counter[$0]! / k}
        var ans = ""
        let M = sortedCandidateChars.count
        
        var queue = [([Character],[Int])]()
        queue.append(([],Array<Int>(repeating: 0, count: M)))
        
        while !queue.isEmpty {
            var newLevel = [([Character],[Int])]()
            for (curChars,curCounter) in queue {
                for idx in 0..<M {
                    if curCounter[idx] < maxNumbersOfEachChar[idx] {
                        let newChars = curChars + [sortedCandidateChars[idx]]
                        if check(newChars) {
                            ans = String(newChars)
                            var newCounter = curCounter
                            newCounter[idx] += 1
                            newLevel.append((newChars,newCounter))
                        }
                    }
                }
            }
            queue = newLevel
        }
        
        return ans
    }
}

