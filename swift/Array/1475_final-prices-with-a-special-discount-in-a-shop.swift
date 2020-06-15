// https://leetcode.com/problems/final-prices-with-a-special-discount-in-a-shop/
class Solution {
    func finalPrices1(_ prices: [Int]) -> [Int] {
        let N = prices.count
        func getOff(_ i: Int) -> Int? {
            var j = i + 1
            while j < N {
                if prices[j] <= prices[i] {
                    return j
                }
                j += 1
            }
            return nil
        }
        var ans = prices
        for i in 0..<N {
            if let j = getOff(i) {
                ans[i] -= prices[j]
            }
        }
        return ans
    }
    func finalPrices(_ prices: [Int]) -> [Int] {
        var arr = Array(repeatElement(0, count: prices.count))
        var st : [Int] = []
        for i in 0..<prices.count{
            while (!st.isEmpty && prices[i] <= prices[st.last!]) {
                let x = st.removeLast()
                arr[x] -= prices[i]
            }
            arr[i] = prices[i]
            st.append(i)
        }
        return arr
    }
}
