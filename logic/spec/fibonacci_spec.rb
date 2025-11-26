require 'spec_helper'

describe Fibonacci do
  describe '.sequence' do
    context 'con un número de términos positivo' do
      it 'genera la secuencia correcta para n=10' do
        expected_sequence = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
        expect(Fibonacci.sequence(10)).to eq(expected_sequence)
      end

      it 'genera la secuencia correcta para n=5' do
        expected_sequence = [0, 1, 1, 2, 3]
        expect(Fibonacci.sequence(5)).to eq(expected_sequence)
      end
    end

    context 'con casos borde' do
      it 'devuelve una secuencia con dos términos para n=2' do
        expect(Fibonacci.sequence(2)).to eq([0, 1])
      end

      it 'devuelve una secuencia con un término para n=1' do
        expect(Fibonacci.sequence(1)).to eq([0])
      end

      it 'devuelve una secuencia vacía para n=0' do
        expect(Fibonacci.sequence(0)).to eq([])
      end

      it 'devuelve una secuencia vacía para un número negativo' do
        expect(Fibonacci.sequence(-5)).to eq([])
      end
    end
  end
end
