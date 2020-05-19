// https://leetcode.com/problems/people-whose-list-of-favorite-companies-is-not-a-subset-of-another-list/
class Solution {
    func peopleIndexes(_ favoriteCompanies: [[String]]) -> [Int] {
        guard favoriteCompanies.count > 1 else {
            return favoriteCompanies.isEmpty ? [] : [1]
        }
        var map = [Set<String>:Int]()
        let N = favoriteCompanies.count
        let sets = favoriteCompanies.map {Set<String>($0)}
        for i in 0..<sets.count {
            map[sets[i]] = i
        }
        let sortedSets = sets.sorted { (s1, s2) -> Bool in
            s1.count < s2.count
        }
        var ans = [Int]()
        for i in 0..<(N - 1){
            var flag = true
            for j in (i + 1)..<N {
                if sortedSets[i].isSubset(of: sortedSets[j]) {
                    flag = false
                    break
                }
            }
            if flag {
                ans.append(map[sortedSets[i]]!)
            }
        }
        ans.append(map[sortedSets[N - 1]]!)
        ans.sort()
        return ans
    }
}
