require 'spec_helper'

describe PrimeNumber do
  describe '.is_prime?' do
    context 'cuando el número es primo' do
      it 'devuelve true para números primos conocidos' do
        expect(PrimeNumber.is_prime?(2)).to be true
        expect(PrimeNumber.is_prime?(3)).to be true
        expect(PrimeNumber.is_prime?(7)).to be true
        expect(PrimeNumber.is_prime?(11)).to be true
        expect(PrimeNumber.is_prime?(13)).to be true
      end
    end

    context 'cuando el número no es primo' do
      it 'devuelve false para números compuestos' do
        expect(PrimeNumber.is_prime?(4)).to be false
        expect(PrimeNumber.is_prime?(9)).to be false
        expect(PrimeNumber.is_prime?(15)).to be false
        expect(PrimeNumber.is_prime?(100)).to be false
      end
    end

    context 'con casos borde' do
      it 'devuelve false para 1' do
        expect(PrimeNumber.is_prime?(1)).to be false
      end

      it 'devuelve false para 0' do
        expect(PrimeNumber.is_prime?(0)).to be false
      end

      it 'devuelve false para números negativos' do
        expect(PrimeNumber.is_prime?(-7)).to be false
      end
    end
  end
end
