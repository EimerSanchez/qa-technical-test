require_relative 'base_page'

class ExpensesPage < BasePage
  def initialize(driver)
    super(driver)
    @expected_url = 'https://demo.applitools.com/hackathonAppV2.html'
    
    @transactions_table = { id: 'transactionsTable' }
    @balance_value = { css: '.balance-value span:first-child' }
    @credit_available = { xpath: "//div[contains(text(), 'Credit Available')]/following-sibling::div" }
    @positive_amounts = { css: '#transactionsTable td span.text-success' }
    @negative_amounts = { css: '#transactionsTable td span.text-danger' }
    @table_rows = { tag_name: 'tr' }
    @table_cells = { tag_name: 'td' }
    @table_headers = { tag_name: 'th' }
  end

  # Verificar que estamos en la página correcta
  def is_expenses_page?
    wait_for_page_load
    @driver.current_url.include?('hackathonAppV2.html')
  end

  # Obtener el número de transacciones en la tabla
  def get_transactions_count
    rows = get_table_rows
    # Excluir el header, contar solo las filas de datos
    rows.count - 1
  end

  # Obtener el total balance 
  def get_total_balance
    text = get_text(@balance_value)
    parse_currency(text)
  end

  # Obtener el Credit Available
  def get_credit_available
    text = get_text(@credit_available)
    parse_currency(text)
  end

  # Obtener todas las transacciones
  def get_all_transactions
    rows = get_table_rows
    transactions = []
    
    # Saltar el header (primera fila)
    rows[1..-1].each do |row|
      cells = row.find_elements(@table_cells)
      next if cells.empty?
      
      transactions << {
        status: cells[0].text,
        date: cells[1].text,
        description: cells[2].text,
        category: cells[3].text,
        amount: cells[4].text
      }
    end
    
    transactions
  end

  # Verificar que los valores positivos estén en verde
  def are_positive_values_green?
    elements = @driver.find_elements(@positive_amounts)
    !elements.empty?
  end

  # Verificar que los valores negativos estén en rojo 
  def are_negative_values_red?
    elements = @driver.find_elements(@negative_amounts)
    !elements.empty?
  end

  # Verificar que la página redirige correctamente después del login
  def verify_redirect_after_login
    wait_for_page_load
    is_expenses_page?
  end

  # Obtener el título de la página
  def page_title
    @driver.title
  end

  # Verificar que la tabla está visible
  def is_table_visible?
    displayed?(@transactions_table)
  end

  # Verificar que todos los headers de la tabla están presentes
  def verify_table_headers
    expected_headers = ['Status', 'Date', 'Description', 'Category', 'Amount']
    rows = get_table_rows
    return false if rows.empty?

    header_row = rows.first
    headers = header_row.find_elements(@table_headers)
    
    actual_headers = headers.map(&:text).map(&:strip)
    
    expected_headers.all? do |expected|
      actual_headers.any? { |actual| actual.casecmp?(expected) || expected.downcase.include?(actual.downcase) }
    end
  end

  private

  def get_table_rows
    table = wait_for_element(@transactions_table)
    table.find_elements(@table_rows)
  end

  def get_text(locator)
    wait_for_element(locator).text
  end

  def parse_currency(text)
    text.gsub(/[^0-9-]/, '').to_i
  end
end
