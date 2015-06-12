require 'openssl'

module AESCrypt
 
  def AESCrypt.decrypt(encrypted_data, key)
    aes = OpenSSL::Cipher::Cipher.new('rc4-hmac-md5')
    iv = aes.random_iv
    aes.decrypt
    aes.key = key
    aes.iv = iv if iv != nil
    aes.update(encrypted_data) + aes.final  
  end
  

  def AESCrypt.encrypt(data, key)
    aes = OpenSSL::Cipher::Cipher.new('rc4-hmac-md5')
    iv = aes.random_iv
    aes.encrypt
    aes.key = key
    aes.iv = iv if iv != nil
    aes.update(data) + aes.final      
  end
end


puts 'enter data:'
data = gets
puts'enter key:'
key = gets

puts 'encryted data:'
encrypted_data = AESCrypt.encrypt(data, key)
puts encrypted_data
puts'decrypted data:'
decrypted_data = AESCrypt.decrypt(encrypted_data, key)
puts decrypted_data
