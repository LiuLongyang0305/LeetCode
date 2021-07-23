// https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list
class Node {
public:
    int val;
    Node *left;
    Node *right;

    Node() {}

    Node(int _val) {
        val = _val;
        left = NULL;
        right = NULL;
    }

    Node(int _val, Node *_left, Node *_right) {
        val = _val;
        left = _left;
        right = _right;
    }
};

class Solution {
    vector<Node*> vec;
public:
    Node *treeToDoublyList(Node *root) {
        dfs(root);
        if (vec.size() == 0) {
            return nullptr;
        }
        int length = vec.size();
        for (int i = 0; i < vec.size(); ++i) {
            vec[i]->left = i == 0 ? vec[length - 1] : vec[ i - 1];
            vec[i]->right = i == length - 1 ? vec[0] : vec[i + 1];
        }
        return vec.at(0);
    }

private:
    void dfs(Node *root) {
        if(nullptr == root) {
            return;
        }
        dfs(root->left);
        vec.push_back(root);
        dfs(root->right);
    }
};