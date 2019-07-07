class Q409_Solution {
    func longestPalindrome(_ s: String) -> Int {
        var set = Set<Character>()
        var count = 0
        for ch in s {
            if set.contains(ch) {
                set.remove(ch)
                count += 1
            } else {
                set.insert(ch)
            }
        }
        return set.isEmpty ? count : (count + 1)
    }
}