//https://leetcode.cn/problems/beautiful-towers-ii/
class Solution {
    func maximumSumOfHeights(_ maxHeights: [Int]) -> Int {
        guard maxHeights.count > 1 else {return maxHeights[0]}
        let N = maxHeights.count
        let  preffix = cal(maxHeights)
        let suffix = [Int](cal([Int](maxHeights.reversed())).reversed())
        var ans = 0
        for i in 0..<N {
            ans = max(ans,suffix[i] + preffix[i])
        }
        return ans
    }


    private func cal(_ maxHeights: [Int]) -> [Int] {
        let N = maxHeights.count
        var ans = [Int](repeating: 0, count: N)
        var stack = [Int]()
        stack.append(0)
        ans[0] = maxHeights[0]
        for i in 1..<N {
            while let l = stack.last, maxHeights[i] < maxHeights[l] {
                stack.removeLast()
            }
            if let l = stack.last {
                ans[i] = ans[l] + maxHeights[i] * (i - l)
            } else {
                ans[i] = maxHeights[i] * (i + 1)
            }
            stack.append(i)
        }
        return [0] + ans
    }
}
