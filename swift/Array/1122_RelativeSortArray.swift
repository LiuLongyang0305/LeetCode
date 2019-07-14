//https://leetcode.com/contest/weekly-contest-145/problems/relative-sort-array/

class Solution {
    typealias Counter = Dictionary<Int,Int>
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        if arr2.isEmpty {
            var temp = arr1
            temp.sort()
            return  temp
        }
        var ans = [Int]()
        var counter = Counter()
        let set = Set<Int>(arr2)
        var other = [Int]()
        for ele in arr1 {
            if set.contains(ele) {
                if nil == counter[ele] {
                    counter[ele] = 1
                } else {
                    counter[ele] = counter[ele]! + 1
                }
                continue
            }
            other.append(ele)
        }
        for  ele in arr2 {
            ans.append(contentsOf: Array<Int>(repeating: ele, count: counter[ele]!))
        }
        other.sort()
        ans.append(contentsOf: other)
        return ans
    }
}