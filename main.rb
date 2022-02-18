# frozen_string_literal: true

require 'matrix'
# class
class RandomMatrixGenerator
  def initialize(x = 0, y = 0)
    @x = x
    @y = y
    @m = Matrix
  end

  def create_matrix(random_number)
    @m = Matrix.build(x, y) { rand(random_number) }
  end
end

class ShowMatrix
  def show_m
    @x.times do |i|
      @y.times do |j|
        @m[i, j] == 1 ? (print '*') : (print '.')
      end
      puts ''
    end
  end
end

class AnalizeMatrix
  def analyze_grid(_randomMatrix)
    neighbours = Matrix.build(@x, @y) { 0 }
    @x.times do |i|
      @y.times do |j|
        neighbours[i, j] += @m[i - 1, j - 1] unless i.zero? || j.zero?
        neighbours[i, j] += @m[i - 1, j] unless i.zero?
        neighbours[i, j] += @m[i - 1, j + 1] unless j == @y - 1 || i.zero?
        neighbours[i, j] += @m[i, j - 1] unless j.zero?
        neighbours[i, j] += @m[i, j + 1] unless j == @y - 1
        neighbours[i, j] += @m[i + 1, j - 1] unless i == @x - 1 || j.zero?
        neighbours[i, j] += @m[i + 1, j] unless i == @x - 1
        neighbours[i, j] += @m[i + 1, j + 1] unless i == @x - 1 || j == @y - 1
      end
    end
    @x.times do |i|
      @y.times do |j|
        if neighbours[i, j] < 2 || neighbours[i, j] > 3
          @m[i, j] = 0
        elsif neighbours[i, j] == 3
          @m[i, j] = 1
        end
      end
    end
  end
end

class InputGame
  def input_values
    puts 'Insert rows:'
    @x = gets.chomp.to_i
    puts 'Inserte columns:'
    @y = gets.chomp.to_i
    @m = Matrix.build(@x, @y) { rand(2) }
  end
end

# grid = RandomMatrixGenerator.new
# grid.create_matrix(2)
# grid.show_m('Generation 1')
# grid.analyze_grid(true)
