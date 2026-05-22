// https://leetcode.com/problems/count-residue-prefixes/
    class Solution {
        func residuePrefixes(_ s: String) -> Int {
            var sb = 0
            var set = Set<Character>()
            var length = 0
            for ch in s {
                length += 1
                set.insert(ch)
                if length % 3 == set.count {
                    sb += 1
                }
            }
            return sb
        }
    }
