class Api::V1::ImagesController < ApplicationController
end


# 1. Image.where(item_id: ???)

# SELECT * FROM images WHERE (images.item_id = ???)

# 2.    def set_image_counts
#           count = Image.where(item_id: ???).count
#       end

# 3.    def set_primary_image_ids
#                
#       end
#

#4. 	def get_first_image_name(item)
#		    image = Image.where(item_id: item.id)[0]
#		    image.file_name
#	    end

#4.1 	def get_first_image_name(item)
#		    image = Image.find_by(item_id: item.id)
#		    image.file_name
#	    end

#BONUS  def ret_json_hash(item_id)
#           item_name
#           primary_image_id
#           primary_image_filename
#           image_count
#       end
#