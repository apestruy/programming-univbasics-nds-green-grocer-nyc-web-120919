def find_item_by_name_in_collection(name, collection)
  hash = {}
  index = 0 
  while index < collection.length do 
    if name == collection[index][:item]
      hash = collection[index]
      return hash
    end 
     index += 1 
    end 
  if hash = {}
    return nil 
  else 
    return hash 
  end 
end

def consolidate_cart(cart)
 con_cart = []
  index = 0
  temp_cart = {}
  names_list = []
  while index < cart.length do 
    name = cart[index][:item]
    hash = cart[index]
    if !temp_cart[name]
      temp_cart[name] = hash
      temp_cart[name][:count] = 1 
      names_list << name
    else
      temp_cart[name][:count] += 1
    end
    index += 1 
  end
  
  index = 0 
  while index < names_list.length do
    con_cart_item = temp_cart[names_list[index]]
    con_cart << con_cart_item
    index += 1 
  end
  con_cart
end 


def apply_coupons(cart, coupons)
      i = 0 
  j = 0 
  cart_with_coupons = cart

  while i < cart.length do 
    j=0
      while j< coupons.length do
        #verify if there is a coupon for that item
        if cart[i][:item] == coupons[j][:item]
         #loop :  1) verify that the coupon can be used  
         #        2) apply the coupon once
         #        3) create/modify hash to add to array

         #1
         while cart[i][:count] >= coupons[j][:num] do
           #2 
           cart[i][:count] -= coupons[j][:num]

           #3 
           cart_with_coupons.push({:item => ""+ cart[i][:item] + " W/COUPON",
            :price => coupons[j][:cost]/coupons[j][:num],
            :clearance => cart[i][:clearance],
            :count => coupons[j][:num]
           })

          end

        end

        j += 1 
      end

    i += 1 
  end
  cart_with_coupons
end

 
 
 
 

def apply_clearance(cart)
  cart.each do |item, attribute_hash| 
    if attribute_hash[:clearance] == true 
      attribute_hash[:price] = (attribute_hash[:price] *
      0.8).round(2) 
    end 
  end 
cart 
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
