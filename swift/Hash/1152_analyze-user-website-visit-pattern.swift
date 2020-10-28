// https://leetcode.com/problems/analyze-user-website-visit-pattern/
class Solution {
    func mostVisitedPattern(_ username: [String], _ timestamp: [Int], _ website: [String]) -> [String] {
        let N = timestamp.count
        let sortedIdx = (0..<N).sorted { timestamp[$0] < timestamp[$1]}
        var map = [String:[String]]()
        for idx in sortedIdx{
            map[username[idx], default: []].append(website[idx])
        }
        // print(map)
        var count = [[String]:Set<String>]()
        for (userName,visitedWebsites) in map {
            guard visitedWebsites.count >= 3 else {
                continue
            }
            let websitesLength = visitedWebsites.count
            for i in 0...(websitesLength - 3) {
                for j in (i + 1)...(websitesLength - 2) {
                    for k in ( j + 1)..<websitesLength {
                        count[[visitedWebsites[i],visitedWebsites[j],visitedWebsites[k]], default: [] ].insert(userName)
                    }
                }
            }
        }
        // print(count)
        guard !count.isEmpty else {
            return []
        }
        var maxCnt = 0
        var ans = [String]()
        for (websiteSequence,users) in count {
            if users.count > maxCnt {
                ans = websiteSequence
                maxCnt = users.count
            } else if users.count == maxCnt {
                if websiteSequence[0] <= ans[0] {
                    if websiteSequence[0] < ans[0] {
                        ans = websiteSequence
                        continue
                    }
                    if websiteSequence[1] <= ans[1] {
                        if websiteSequence[1] < ans[1] {
                            ans = websiteSequence
                            continue
                        }
                        if websiteSequence[2] < ans[2] {
                            ans = websiteSequence
                            continue
                        }
                    }
                }
            }
        }
        return ans
    }
}