# -*- coding: utf-8 -*-
class Service < ActiveRecord::Base
 has_and_belongs_to_many :users
 has_many :params

  def get_full_url
    full_url=self.url

   if self.params.size>0
     full_url+="?"

     self.params.each do |param|
      full_url+=param.name+"="+param.value+"&"
     end

     full_url=full_url[0..-2] #remove last &
   end

     puts "Full URL:"+ full_url
     return full_url
  end

#    query_string=URI.encode_www_form(self.params)

    #url encoding (e.g. space to %20)
#    encoded_query_string =URI.encode_www_form_component(query_string.to_s)
#    full_url=URI.join(self.url, encoded_query_string).to_s

#end
end
