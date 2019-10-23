//https://leetcode.com/problems/n-ary-tree-preorder-traversal/
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
class Solution {
    vector<int > ans;
public:
    vector<int> preorder1(Node* root) {
        internalPreorder(root);
        return  ans;
    }
    vector<int> preorder(Node* root) {
        return  preorderTraversalIteration(root);
    }
private:
    void internalPreorder(Node* root) {
        if(nullptr == root) {
            return;
        }
        ans.push_back(root->val);
        for(auto& node: root->children) {
            internalPreorder(node);
        }
    }

    vector<int > preorderTraversalIteration(Node*  root) {
        vector<int > result;
        if(nullptr != root) {
            stack<Node*> nodes;
            nodes.push(root);
            while (!nodes.empty()){
                Node *temp = nodes.top();
                nodes.pop();
                result.push_back(temp->val);
                vector<Node *>  children = temp->children;
                for (int i = children.size() - 1; i >= 0 ; --i) {
                    nodes.push(children[i]);
                }
            }
        }
        return result;
    }
};