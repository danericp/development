class Solution:
    def longestPalindrome(self, s: str) -> str:
        n1, n2 = 0, 0
        out = ""
        out_length = 0
        for ctr1 in range(0,len(s)):
            n1, n2 = ctr1, ctr1
            print("forloop1 n1:" + str(n1) + " n2:" + str(n2))
            for ctr2 in range(0, 2):
                print("ctr2:" + str(ctr2))
                if (n2<len(s)):
                    n2+=ctr2
                    print("forloop2 n1:" + str(n1) + " n2:" + str(n2))
                    while n1>=0 and n2<=len(s)-1 and s[n1]==s[n2]:
                        print( "MATCH " + s[n1] + " " + s[n2] + " = " + s[n1:n2+1] )
                        if n2-n1+1 > out_length:
                            out = s[n1:n2+1]
                            out_length = n2-n1
                        n1-=1
                        n2+=1
                    n1, n2 = ctr1, ctr1
        return out
# str1 = 'cbbd'
str1 = 'a'
obj_Solution = Solution()
print('Example List 1 is ' + str(str1))
print("\nGiven a string s, return the longest palindromic substring in s.\nSolution: " +
      str(obj_Solution.longestPalindrome(str1)))