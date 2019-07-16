//https://leetcode.com/problems/subdomain-visit-count/
typealias Counter = Dictionary<String,Int>
class Solution {
    var counter = Counter()
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var ans = [String]()
        for cpdomain in cpdomains {
            let parts = cpdomain.components(separatedBy: " ")
            if parts.count == 2 {
                let num = Int(parts[0])!
                let domain = parts[1]
                validateDomain(domain: domain)
                counter[domain] = counter[domain]! + num
                let domainCompoments  = domain.components(separatedBy: ".")
                let size = domainCompoments.count
                for i in 1...(size - 1) {
                    var currentDomain = ""
                    var j = i
                    while j < size {
                        currentDomain += domainCompoments[j]
                        if j != size - 1  {
                            currentDomain.append(".")
                        }
                        j += 1
                    }
                    validateDomain(domain: currentDomain)
                    counter[currentDomain] = counter[currentDomain]! + num
                }
            }
        }
        for (key,value) in counter {
            ans.append("\(value) \(key)")
        }
        return ans
    }
    
    private  func validateDomain(domain: String)  {
        if nil == counter[domain] {
            counter[domain] = 0
        }
    }
}
