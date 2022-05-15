// https://leetcode.com/problems/find-resultant-array-after-removing-anagrams/
class Solution {
    func removeAnagrams(_ words: [String]) -> [String] {
        let N = words.count
        let counters = words.map { getCounter($0)}
        var ans = [String]()
        ans.append(words[0])
        var last = 0
        var i = 1
        while i < N {
            if counters[i] != counters[last] {
                ans.append(words[i])
                last = i
            }
            i += 1
        }


        return ans

    }


    private func getCounter(_ word: String) -> [Character:Int] {
        var ans = [Character:Int]()
        for ch in word {
            ans[ch,default: 0] += 1
        }
        return ans
    }
}