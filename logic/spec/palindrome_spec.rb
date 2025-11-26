require 'spec_helper'

describe Palindrome do
  describe '.is_palindrome?' do
    context 'cuando la cadena es un palíndromo' do
      it 'devuelve true para palíndromos simples' do
        expect(Palindrome.is_palindrome?('racecar')).to be true
        expect(Palindrome.is_palindrome?('level')).to be true
      end

      it 'devuelve true para palíndromos con mayúsculas y minúsculas' do
        expect(Palindrome.is_palindrome?('Anna')).to be true
        expect(Palindrome.is_palindrome?('Kayak')).to be true
      end

      it 'devuelve true para frases que son palíndromos, ignorando espacios y puntuación' do
        expect(Palindrome.is_palindrome?('A man, a plan, a canal: Panama')).to be true
        expect(Palindrome.is_palindrome?('No lemon, no melon.')).to be true
      end
    end

    context 'cuando la cadena no es un palíndromo' do
      it 'devuelve false para no palíndromos' do
        expect(Palindrome.is_palindrome?('hello')).to be false
        expect(Palindrome.is_palindrome?('world')).to be false
      end
    end

    context 'con casos borde' do
      it 'devuelve true para una cadena vacía' do
        expect(Palindrome.is_palindrome?('')).to be true
      end

      it 'devuelve true para una cadena con un solo carácter' do
        expect(Palindrome.is_palindrome?('a')).to be true
      end
    end
  end
end
