//https://leetcode.com/problems/x-of-a-kind-in-a-deck-of-cards/submissions/
class Solution {
    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        var counter = [Int:Int]()
        for d in deck {
            counter.updateValue((counter[d] ?? 0) + 1, forKey: d)
        }
        var ans = -1
        for(_,cnt) in  counter{
            ans = ans == -1 ? cnt : gcd(ans, cnt)
            guard ans > 1 else {
                return false
            }
        }
        return true
    }
    private func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a %  b)
    }
}