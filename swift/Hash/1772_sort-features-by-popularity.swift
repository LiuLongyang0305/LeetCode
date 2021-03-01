// https://leetcode.com/problems/sort-features-by-popularity/
class Solution {
    func sortFeatures(_ features: [String], _ responses: [String]) -> [String] {
        var counter = [String: Int]()
        for feature in features {
            counter[feature] = 0
        }
        let featureSet = Set<String>(features)
        for response in responses {
            var appearances = Set<String>()
            for apprance in response.split(separator: " ") {
                let t = String(apprance)
                if featureSet.contains(t) {
                    appearances.insert(t)
                }
            }
            for app in appearances {
                counter[app, default: 0] += 1
            }
        }
        return features.sorted {counter[$0]! > counter[$1]!}
        
    }
}
