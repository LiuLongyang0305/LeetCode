class Q929_Solution {
    var emailAddresses : Set<String> = Set<String>()
    func numUniqueEmails(_ emails: [String]) -> Int {
        for email in emails {
            let validEmail = getValidEmailAddress(email)
            if !emailAddresses.contains(validEmail) {
                emailAddresses.insert(validEmail)
            }
        }
        return emailAddresses.count
    }
    private func getValidEmailAddress(_ email : String) -> String {
        let subStrs = email.split(separator: "@")
        var localNames = subStrs[0].split(separator: "+")
        localNames[0].removeAll { $0 == "."}
        return  (localNames[0] + "@" + subStrs[1])
    }
}