// https://leetcode.com/problems/people-whose-list-of-favorite-companies-is-not-a-subset-of-another-list/
class Solution {
    func peopleIndexes(_ favoriteCompanies: [[String]]) -> [Int] {
        var ans = [Int]()
        let faverateCompainiesSet = favoriteCompanies.map {Set<String>($0)}
        let N = favoriteCompanies.count
        for i in 0..<N {
            var flag = true
            for j in 0..<N where j != i{
                flag = flag && !faverateCompainiesSet[i].isSubset(of: faverateCompainiesSet[j])
            }
            if flag {
                ans.append(i)
            }
        }
        return ans.sorted()
    }
}