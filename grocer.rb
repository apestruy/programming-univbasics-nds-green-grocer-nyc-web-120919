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
 coupons.each do |coupon|
    coupon_name = coupon[:item]
    coupon_item_num = coupon[:num]
    cart_item = cart[coupon_name]

    next if cart_item.nil? || cart_item[:count] < coupon_item_num

    cart_item[:count] -= coupon_item_num

    coupon_in_cart = cart["#{coupon_name} W/COUPON"]

    if coupon_in_cart
      coupon_in_cart[:count] += 1
    else
      cart["#{coupon_name} W/COUPON"] = { 
        price: coupon[:cost], 
        clearance: cart_item[:clearance], 
        count: 1
      }
    end
  end

  cart
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
