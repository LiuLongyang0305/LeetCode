//https://leetcode.cn/problems/split-and-merge-array-transformation/
class Solution {
    func minSplitMerge(_ nums1: [Int], _ nums2: [Int]) -> Int {
        guard nums2 != nums1 else {return 0}
        var level = 0
        var queue = [[Int]]()
        queue.append(nums1)
        var visited = Set<[Int]>()
        visited.insert(nums1)

        while !queue.isEmpty {
            // print(queue)
            guard !visited.contains(nums2) else {return level}
            level += 1
            var newQuaue = [[Int]]()
            for arr in queue {
                newQuaue.append(contentsOf: getPossibleTransferResults(of: arr, &visited))
            }
            queue = newQuaue

        }
        return -1
    }

    private func getPossibleTransferResults(of arr: [Int], _ visited: inout Set<[Int]>) -> [[Int]] {
        var results = [[Int]]()

        func add(_ cur: [Int]) {
            guard !visited.contains(cur) else {return}
            visited.insert(cur)
            results.append(cur)
        }


        let N = arr.count

        for l in 0..<N {
            for r in l..<N {
                var right = (l > 0 ? [Int](arr[..<l]) : []) + (r < N - 1 ? [Int](arr[(r+1)...]) : [])
                let temp = [Int](arr[l...r])
                var left = [Int]()
                //开头
                add(temp + right)
                //最后
                add(right + temp)
                while right.count > 1 {
                    left.append(right.removeFirst())
                    add(left + temp + right)
                }

            }
        }

        return results
    }
}
