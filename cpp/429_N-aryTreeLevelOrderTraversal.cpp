//https://leetcode.com/problems/n-ary-tree-level-order-traversal/
class Node {
public:
    int val;
    vector<Node *> children;

    Node() {}

    Node(int _val, vector<Node *> _children) {
        val = _val;
        children = _children;
    }
};
class Solution{
public:
    vector<vector<int>> levelOrder(Node* root) {
        vector<vector<int>> ans = vector<vector<int>>();
        if (nullptr == root) {
            return ans;
        }
        queue<Node *> nodes = queue<Node *>();
        nodes.push(root);
        while (!nodes.empty()) {
            vector<int > level = vector<int >();
            int length = nodes.size();
            for (int i = 0; i < length; ++i) {
                Node *temp = nodes.front();
                nodes.pop();
                level.push_back(temp->val);
                for (auto node : temp->children) {
                    nodes.push(node);
                }
            }
            ans.push_back(level);
        }
        return  ans;
    }
};