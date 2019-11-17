//https://leetcode.com/problems/smallest-common-region/
class Solution {
    private var parents = [String:String]()

    func findSmallestRegion(_ regions: [[String]], _ region1: String, _ region2: String) -> String {
        for region in regions {
            for i in 1..<region.count {
                parents[region[i]] =  region[0]
            }
        }
        let p1 = getParents(region1)
        let p2 = getParents(region2)
        if p1[0] == region1 || p1[0] == region2  {
            return p1[0]
        }
        if p2[0] == region1 || p2[0] == region2  {
            return p2[0]
        }
        let length = min(p1.count, p2.count)
        var i = 0
        while i < length {
            if p2[i] != p1[i] {
                return p1[i - 1]
            }
            i += 1
        }
        return p1[length - 1]
    }
    private func getParents(_ region: String) -> [String] {
        var ans = [String]()
        ans.append(region)
        var temp = region
        while let par = parents[temp] {
            ans.insert(par, at: 0)
            temp = par
        }
        return ans
    }
}