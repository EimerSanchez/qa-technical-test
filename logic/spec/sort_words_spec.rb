require 'spec_helper'

describe SortWords do
  describe '.sort' do
    it 'ordena correctamente una frase simple' do
      sentence = 'hello world this is a test'
      expected = 'a hello is test this world'
      expect(SortWords.sort(sentence)).to eq(expected)
    end

    it 'ordena correctamente ignorando mayúsculas y minúsculas' do
      sentence = 'Apple banana Cherry apple Banana'
      expected = 'apple Apple Banana banana Cherry'
      expect(SortWords.sort(sentence)).to eq(expected)
    end

    it 'devuelve una cadena vacía para una entrada vacía' do
      expect(SortWords.sort('')).to eq('')
    end

    it 'devuelve la misma palabra para una entrada de una sola palabra' do
      expect(SortWords.sort('Solitary')).to eq('Solitary')
    end
  end
end
