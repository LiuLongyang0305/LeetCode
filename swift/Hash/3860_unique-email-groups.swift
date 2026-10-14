    //https://leetcode.cn/problems/unique-email-groups/description/
    class Solution {
        func uniqueEmailGroups(_ emails: [String]) -> Int {

            func solve(_ email: String) -> String {
                let idx = email.firstIndex(of: "@")!
                let net = String(email[email.index(after: idx)...]).lowercased()
                var local = String(email[..<idx]).lowercased()
                if let firstIdx = local.firstIndex(of: "+") {
                    local.removeSubrange(firstIdx..<local.endIndex)
                }
                local.removeAll {$0 == "."}
                return local + "_" + net
            }


            var set = Set<String>()
            for e in emails {
                set.insert(solve(e))
            }
            return set.count
        }
    }
