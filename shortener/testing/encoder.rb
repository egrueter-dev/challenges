
string = "http://www.google.com"

 module AnyBase
   ENCODER = Hash.new do |h,k|
     h[k] = Hash[ k.chars.map.with_index.to_a.map(&:reverse) ]
   end
   DECODER = Hash.new do |h,k|
     h[k] = Hash[ k.chars.map.with_index.to_a ]
   end
   def self.encode( value, keys )
     ring = ENCODER[keys]
     base = keys.length
     result = []
     until value == 0
       result << ring[ value % base ]
       value /= base
     end
     result.reverse.join
   end
   def self.decode( string, keys )
       ring = DECODER[keys]
       base = keys.length
       string.reverse.chars.each_with_index.inject(0) do |sum,(char,i)|
         sum + ring[char] * base**i
       end
   end
 end

 base36 = "0123456789abcdefghijklmnopqrstuvwxyz"
 db_id = 12341235

 p AnyBase.encode( db_id, base36 )
 #=> "7cik3"

 p AnyBase.decode( "7cik3", base36 )
 #=> 12341235



# User's table


Url Table
  Original URL
  Shortened URL
  USER ID
