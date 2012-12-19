# -*- coding: utf-8 -*-
class Service < ActiveRecord::Base
 has_and_belongs_to_many :users
 has_many :params

  def get_full_url
    full_url=self.url

    if self.params.size>0
      full_url+="?"

      self.params.each do |param|
        full_url+=encode(param.name)+"="+encode(param.value)+"&"
      end
      full_url=full_url[0..-2] #remove last &
    end

    return full_url
  end


#
#
#  query_string=""
#
#
#  if self.params.size>0
#
#
#    #use only name,value of param; encode special signs
#    key_value_params = Hash[self.params.map{|p| [encode(p.name), encode(p.value)]}]
#
#    #generate query string (e.g. searchFor=markus&filter=true)
#    #query_string=key_value_params.to_query
#    #URI.encode_www_form(key_value_params)
#    #puts query_string
#
#  else
#
#  end
#
#  #join with url (e.g. http://www.example.com/search
#  full_url=self.urlquery_string)
#
#end
#
  def encode(string)
    URI.escape(string)
  end
end
