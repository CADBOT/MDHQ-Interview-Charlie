# standard version
def factorial(x)
  return 1 if x == 1
  x * factorial(x-1)
end

# Memoized version
class Factorial
  @@memo = {}
  def self.compute(x)
   return 1 if x == 0
   unless @@memo.key?(x)
     @@memo[x] = x * compute(x-1)
   end
   @@memo[x]
  end
end
