//https://leetcode.com/problems/maximum-palindromes-after-operations/description/

class Solution {
    func maxPalindromesAfterOperations(_ words: [String]) -> Int {

        let sortedWords = words.sorted { $0.count < $1.count}
        var counter = [Character:Int]()

        for word in sortedWords {
            for ch in word {
                counter[ch,default: 0] += 1
            }
        }

        var sortedCounter = counter.sorted {$0.value < $1.value}

        func update(_ cnt: Int) -> Bool {
            var sum = cnt
            for i in 0..<sortedCounter.count {
                let delta = min(sum, sortedCounter[i].value / 2 * 2)
                sum -= delta
                sortedCounter[i].value -= delta
                if sum == 0 {
                    return true
                }
            }
            return false
        }

        func removeOne() {
            if let idx = sortedCounter.firstIndex(where: { $0.value & 1 == 1}) {
                sortedCounter[idx].value -= 1
            } else {
                if let idx = sortedCounter.firstIndex(where: { $0.value > 0}) {
                    sortedCounter[idx].value -= 1
                }
            }


        }


        var ans = 0

        for word in sortedWords {
            let N = word.count
            if N & 1 != 0 {
                removeOne()
            }
            if update(N / 2 * 2) {
                ans += 1
            } else {
                break
            }
        }

        return ans
    }
}
