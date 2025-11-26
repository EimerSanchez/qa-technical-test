# Clase para ordenar las palabras de una cadena de texto
class SortWords
  # Ordena las palabras de una cadena alfabéticamente, ignorando mayúsculas y minúsculas.
  # @param sentence [String] La cadena de texto a ordenar.
  # @return [String] Una nueva cadena con las palabras ordenadas.
  def self.sort(sentence)
    # Separamos la cadena en palabras, las ordenamos ignorando mayúsculas/minúsculas,
    # y luego las unimos de nuevo con un espacio.
    words = sentence.split
    sorted_words = words.sort_by { |word| word.downcase }
    sorted_words.join(' ')
  end
end
