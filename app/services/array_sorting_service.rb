# frozen_string_literal: true

class ArraySortingService
  TASK_1_BASE_ARRAY = %w[XXS XS S M L XL XXL XS/P S/P M/P L/P XL/P].freeze
  TASK_2_BASE_ARRAY = %w[000 00 0 2 4 6 8 10 12 14].freeze

  def initialize(task_1_array:, task_2_array:)
    @task_1_array = task_1_array
    @task_2_array = task_2_array
  end

  def call
    sort_sizes_1 task_1_array
    puts '-' * 10
    sort_sizes_2 task_2_array
  end

  attr_reader :task_1_array, :task_2_array

  private

  def sort_sizes_1 arr
    puts 'TASK #1'
    puts 'version one'
    pp TASK_1_BASE_ARRAY & arr
    puts 'version two(handle duplicates)'
    pp (TASK_1_BASE_ARRAY & arr).flat_map { |n| [n] * arr.count(n) }
  end

  def sort_sizes_2 arr
    puts 'TASK #2'
    puts 'version one'
    pp arr.sort_by { |n| TASK_2_BASE_ARRAY.index(n) }
    puts 'version two(avoid O(n^2))'
    tmp = TASK_2_BASE_ARRAY.map.with_index.to_h
    pp arr.sort_by { |n| tmp.fetch(n) }
  end
end