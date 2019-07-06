//https://leetcode.com/problems/filling-bookcase-shelves/
class Solution {
    func minHeightShelves(_ books: [[Int]], _ shelf_width: Int) -> Int {

        var dp = Array<Int>(repeating: 0, count: books.count + 1)
        for i in 1...books.count {
            var width = books[i - 1][0]
            var height = books[i - 1][1]
            dp[i] = dp[i - 1] + height
            var j = i - 1
            while j > 0 && width + books[j - 1][0] <= shelf_width {
                height = max(height, books[j - 1][1])
                width += books[j - 1][0]
                dp[i] = min(dp[i], dp[j - 1] + height)
                j -= 1
            }
        }
        return dp[books.count]
    }
}