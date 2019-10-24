//https://leetcode.com/problems/serialize-and-deserialize-binary-tree/
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;

    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Codec {
public:

    // Encodes a tree to a single string.
    string serialize(TreeNode *root) {
        string ans = "";
        ans += "[";
        deque<TreeNode *> nodes;
        if (root) {
            nodes.push_back(root);
        }
        bool isLastLevel = true;
        while (!nodes.empty()) {
            int length = nodes.size();
            string level = "";
            for (int i = 0; i < length; ++i) {
                TreeNode *temp = nodes.front();
                nodes.pop_front();
                if (!temp) {
                    level += "null,";
                } else {
                    level += to_string(temp->val) + ",";
                    nodes.push_back(temp->left);
                    nodes.push_back(temp->right);
                    if (temp->right) {
                        isLastLevel = !(temp->right->left || temp->right->right);
                    }
                    if (temp->left) {
                        isLastLevel = !(temp->left->left || temp->left->right);
                    }

                }
            }

            if (isLastLevel) {
                while (!nodes.back()) {
                    nodes.pop_back();
                }
            }
            ans += level;
        }
        if (ans.length() > 1) {
            ans.erase(ans.length() - 1, 1);
        }
        ans += "]";
        return ans;
    }

    // Decodes your encoded data to tree.
    TreeNode *deserialize(string data) {
        data.erase(0, 1);
        data.erase(data.length() - 1, 1);
        if (data.length() == 0) {
            return (TreeNode *) nullptr;
        }

        queue<string> nodeStrs = components(data);
        TreeNode *head = new TreeNode(stoi(nodeStrs.front(), nullptr, 10));
        nodeStrs.pop();
        queue<TreeNode *> nodes;
        nodes.push(head);

        while (!nodeStrs.empty()) {

            TreeNode *parent = nodes.front();
            nodes.pop();

            string leftStr = nodeStrs.front();
            nodeStrs.pop();
            if (leftStr != "null") {
                TreeNode *left = new TreeNode(stoi(leftStr, nullptr, 10));
                nodes.push(left);
                parent->left = left;
            }
            if (!nodeStrs.empty()) {
                string rightStr = nodeStrs.front();
                nodeStrs.pop();
                if (rightStr != "null") {
                    TreeNode *right = new TreeNode(stoi(rightStr, nullptr, 10));
                    nodes.push(right);
                    parent->right = right;
                }
            }
        }

        return head;
    }

private:
    queue<string> components(string str) {
        queue<string> ans;
        while (str.length() > 0) {
            int i = 0;
            while (i < str.length() && str[i] != ',') {
                i += 1;
            }
            ans.push(str.substr(0, i));
            str.erase(0, i + 1);
        }
        return ans;
    }
};