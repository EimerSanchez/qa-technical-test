# Clase para determinar si una cadena es un palíndromo
class Palindrome
  # Verifica si una cadena es un palíndromo.
  # Un palíndromo es una palabra o frase que se lee igual de izquierda a derecha que de derecha a izquierda,
  # ignorando mayúsculas, minúsculas, espacios y puntuación.
  # @param text [String] La cadena a verificar.
  # @return [Boolean] True si es un palíndromo, false en caso contrario.
  def self.is_palindrome?(text)
    # Normalizamos la cadena: la convertimos a minúsculas y eliminamos todo lo que no sea una letra o un número.
    normalized_text = text.downcase.gsub(/[^a-z0-9]/, '')

    # Comparamos la cadena normalizada con su reverso.
    normalized_text == normalized_text.reverse
  end
end 
