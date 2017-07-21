# Find the longest increasing (noncontiguous) subsequence of an array
# [5, 2, 3, 4, 1] => 3
# [1, 3, 2, 4, 1, 5, 7, 3] => 5
# [4, 1, 5, 4, 2, 7, 5, 3, 5, 6] => 5

def longest_increasing_subsequence(seq)
  memo = []
  seq.each_with_index do |curr_num, curr_idx|
    longest = 0
    seq[0..curr_idx].each_with_index do |prev_num, prev_idx|
      if prev_num < curr_num && memo[prev_idx] > longest
        longest = memo[prev_idx]
      end
    end

    memo << longest + 1
  end

  memo.max
end

arr = File.readlines('./test-set.rtf')
arr.map! { |el| el.to_i }

puts longest_increasing_subsequence(arr)


# puts longest_increasing_subsequence([5, 2, 3, 4, 1]) == 3
# puts longest_increasing_subsequence([1, 3, 2, 4, 1, 5, 7, 3]) == 5
# puts longest_increasing_subsequence([4, 1, 5, 4, 2, 7, 5, 3, 5, 6]) == 5
