//https://leetcode.com/problems/compare-version-numbers/

let charToInt : Dictionary<Character,Int> = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9]

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var  version1ToNumber = getVersionNumber(version1)
        var version2Tonumber  = getVersionNumber(version2)

        return compare(&version1ToNumber, &version2Tonumber)
    }
    
    private func getVersionNumber(_ version: String) -> [Int] {
        let parts = version.split(separator: ".")
        return parts.map({ (str) -> Int in
            Int(str)!
        })
    }
    
    private func compare(_ versionNumber1: inout [Int], _ versionNumber2: inout  [Int]) -> Int {
        let size1 = versionNumber1.count
        let size2 = versionNumber2.count
        if size1 < size2 {
            versionNumber1.append(contentsOf: Array<Int>(repeating: 0, count: size2 - size1))
        }
        if size2 < size1 {
            versionNumber2.append(contentsOf: Array<Int>(repeating: 0, count: size1 - size2))
        }
        for i in 0..<versionNumber1.count {
            if versionNumber1[i] != versionNumber2[i] {
                return versionNumber1[i] < versionNumber2[i] ? -1 : 1
            }
        }
        return 0
    }
}
