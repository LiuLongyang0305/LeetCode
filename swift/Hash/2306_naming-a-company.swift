// https://leetcode.com/problems/naming-a-company/
class Solution {
    private let lowercases = "qwertyuioplkjhgfdsazxcvbnm"
    func distinctNames(_ ideas: [String]) -> Int {
        let ideasChars = ideas.map { [Character]($0) }
        var hash = Set<Int>()
        for t in ideasChars {
            hash.insert(t.hashValue)
        }
        var counter = [Character:[Character:Int]]()
        lowercases.forEach { ch in
            counter[ch] = createCounter()
        }
        for var idea in ideasChars {
            let ori = idea[0]
            for new in lowercases {
                idea[0] = new
                guard !hash.contains(idea.hashValue) else {
                    continue
                }
                counter[ori]?[new]? += 1
            }
        }
        var ans = 0
        for first in lowercases {
            for second in lowercases {
                ans += (counter[first]?[second] ?? 0) * (counter[second]?[first] ?? 0)
            }
        }
        return ans
    }

    private func createCounter() -> [Character:Int] {
        var ans = [Character:Int]()
        lowercases.forEach { ch in
            ans[ch] = 0
        }
        return ans
    }
}
