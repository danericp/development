class Solution:
    def lengthOfLongestSubstring(self, s):
        len1 = 0
        set1 = set()
        for n1 in range(0,len(s)):
            len2 = 0
            for n2 in range(n1,len(s)):
                set1.add(s[n2])
                if len(set1) == len2:
                    break
                else:
                    len2 = len(set1)
                    len1 = len(set1) if len(set1) > len1 else len1
            set1.clear()
        return str(len1)

str1='aab'
obj_Solution = Solution()
print('Example String is ' + str1)
print('Length of String is ' + str(len(str1)))
print('Length of longest distinct String is ' + obj_Solution.lengthOfLongestSubstring(str1))