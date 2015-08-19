class Tree < ActiveRecord::Base
	belongs_to :user

	# def paypal_url(return_url)
	# 	value = {
	# 		business: ,
	# 		cmd: '_cart'
	# 		uplooad: 1,
	# 		return: return_url,
	# 		invoice: id,
	# 		amount: params[:amount],
	# 		item_name: 'Donating Trees to Greenpop',
	# 		quantity: '1'
	# 	}
	# 	"#{Rails.application.secrets.paypal_host}cgi-bin/webscr?"+values.to_query
	# end
end
