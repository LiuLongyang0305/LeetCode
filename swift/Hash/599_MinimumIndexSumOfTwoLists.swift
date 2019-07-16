//https://leetcode.com/problems/minimum-index-sum-of-two-lists/
class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var ans = [String]()
        var minSumIndex = Int.max
        let commonInterest = Set<String>(list1).intersection(Set<String>(list2))
        var restaurantToIndices = Dictionary<String,Int>()
        for i in 0..<list1.count {
            let res = list1[i]
            if commonInterest.contains(res) {
                restaurantToIndices[res] = i
            }
        }
        for i in 0..<list2.count {
            let res = list2[i]
            if commonInterest.contains(res) {
                restaurantToIndices[res] = restaurantToIndices[res]! + i
                if let num = restaurantToIndices[res] {
                    if  num < minSumIndex {
                        minSumIndex = num
                    }
                }
            }
        }
        
        for (key,val) in restaurantToIndices {
            if val == minSumIndex {
                ans.append(key)
            }
        }
        return ans
    }

}
