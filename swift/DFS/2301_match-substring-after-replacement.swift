// https://leetcode.com/problems/match-substring-after-replacement/
class Solution {
    func matchReplacement(_ s: String, _ sub: String, _ mappings: [[Character]]) -> Bool {
        let M = s.count
        let N = sub.count
        let sChars = [Character](s)
        let subChars = [Character](sub)


        var charToIndices = [Character:[Int]]()
        for i in 0..<M {
            charToIndices[sChars[i],default: []].append(i)
        }

        var map = [Character:Set<Character>]()
        for mapping in mappings {
            map[mapping[0],default: []].insert(mapping[1])
        }
        func  dfs(_ sIdx: Int, _ subIdx: Int) -> Bool {


            guard subIdx < N else {return true}
            guard sIdx < M else { return false }
            if sIdx == -1 {
                var possible = map[subChars[0]] ?? []
                possible.insert(subChars[0])

                for ch in possible {
                    for idx in (charToIndices[ch] ?? []) {
                        guard !dfs(idx + 1, subIdx + 1) else {
                            return true
                        }
                    }
                }

            } else {
                if subChars[subIdx] == sChars[sIdx] {
                    return dfs(sIdx + 1, subIdx + 1)
                } else {
                    guard let possible = map[subChars[subIdx]], possible.contains(sChars[sIdx]) else {
                        return false
                    }
                    return dfs(sIdx + 1, subIdx + 1)
                }
            }
            return false
        }
        return dfs(-1,0)
    }
}