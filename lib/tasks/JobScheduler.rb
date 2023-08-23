class JobScheduler
  def initialize(arr, t)
    @arr = arr
    @t = t
    @n = arr.length
  end

  def print_job_scheduling
    # Sort all jobs according to decreasing order of profit
    @arr.sort! { |a, b| b[2] <=> a[2] }

    # To keep track of free time slots
    result = []

    # To store result (Sequence of jobs)
    job = []
    @t.times do |i|
      job[i] = '-1'
      result[i] = false
    end

    # Iterate through all given jobs
    @n.times do |i|
      # Find a free slot for this job
      # (Note that we start from the last possible slot)
      (@arr[i][1] - 1).downto(0) do |j|
        # Free slot found
        if !result[j]
          result[j] = true
          job[j] = @arr[i][0]
          break
        end
      end
    end

    puts "Following is the maximum profit sequence of jobs:"
    puts job.join(', ')

  end
end

# Driver Code
arr = [['a', 2, 100],
       ['b', 1, 19],
       ['c', 2, 27],
       ['d', 1, 25],
       ['e', 3, 15]]

scheduler = JobScheduler.new(arr, 3)
scheduler.print_job_scheduling

class CashFlowCalculator
  def initialize(graph)
    @graph = graph
    @n = graph.length
    @amount = Array.new(@n, 0)
  end

  def get_min(arr)
    min_ind = 0
    (1..@n).each do |i|
      min_ind = i if arr[i] < arr[min_ind]
    end
    min_ind
  end

  def get_max(arr)
    max_ind = 0
    (1...@n).each do |i|
      max_ind = i if arr[i] > arr[max_ind]
    end
    max_ind
  end

  def min_cash_flow_rec(amount)
    mx_credit = get_max(amount)
    mx_debit = get_min(amount)

    return if amount[mx_credit] == 0 && amount[mx_debit] == 0

    min = min_of_2(-amount[mx_debit], amount[mx_credit])
    amount[mx_credit] -= min
    amount[mx_debit] += min

    "Person #{mx_debit} pays #{min} to Person #{mx_credit}\n" + min_cash_flow_rec(amount)
  end

  def min_cash_flow
    (0...@n).each do |p|
      (0...@n).each do |i|
        @amount[p] += (@graph[i][p] - @graph[p][i])
      end
    end

    min_cash_flow_rec(@amount)
  end
end

# Test the CashFlowCalculatorClass
graph = [
  [0, 1000, 2000],
  [0, 0, 5000],
  [0, 0, 0]
]

calculator = CashFlowCalculator.new(graph)
puts calculator.min_cash_flow

class WordAnalyzer
  MAX_CHAR = 26

  def self.get_key(str)
    visited = Array.new(MAX_CHAR, false)

    str.each_char do |char|
      visited[char.ord - 97] = true
    end

    key = ""

  MAX_CHAR.times do |j|
    key += (97 + j).chr if visited[j]
  end

  key
  end

  def self.words_with_same_char_set(words)
    hash = {}

    words.each_with_index do |word, i|
      key = get_key(word)
      if hash.key?(key)
        hash[key].push(i)
      else
        hash[key] = [i]
      end
    end

    result = []
    hash.each_value do |indexes|
      result << indexes.map { |index| words[index] }
    end

    result
  end
end

# Test the WordAnalyzer class
words = [
  "may", "student", "students", "dog", "studentssess",
  "god", "cat", "act", "tab", "bat", "flow", "wolf",
  "lambs", "any", "yam", "balms", "looped", "poodle"
]

result = WordAnalyzer.words_with_same_char_set(words)

result.each do |group|
  puts group.join(", ")
end

#imposto é roubo
#sonegar é legítima defesa

# viva a informação descentralizada e distribuida
# compre bitcoin
# aprenda sobre contratos inteligentes
# estude criptografia
# aprenda inglês
# só assim viverá melhor

items = [Item.new(60,10), Item.new(100, 20), Item.new(120,30)]
max_weight = 50
result = fractional_knapscak(max_weight, items)

puts "Maximum value achievable: #{result}"