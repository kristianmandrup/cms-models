module Helpers
  def expected_title_translations
    {'en'=>'hello', 'es'=>'Hola', 'fr'=>'Salut', 'de'=>'Hallo'}
  end
  
  def expected_description_translations
    {'en'=>'hello world', 'es'=>'Hola mundo', 'fr'=>'Salut tout le monde', 'de'=>'Hallo Welt' }
  end
  
  def generic_attributes_array
    [
      {caption: 'caption1', input: 'input1', output: 'output1', value: 'value1' },
      {caption: 'caption2', input: 'input2', output: 'output2', value: 'value2' }
    ]
  end
  
  def file
    File.new(File.join('spec', 'fixtures', 'ruby.png'), 'r') 
  end
end
