class Item < ApplicationRecord
    has_many :images

    #----------------------------------------------------------------------
    #1
    #----------------------------------------------------------------------

    # def get_all_img
    #     self.images.where(item_id: self.id)
    # end

    def self.get_all_img(item_id)
        Image.all.where(item_id: item_id)
    end

    #----------------------------------------------------------------------
    #2
    #----------------------------------------------------------------------
    # Instance Method
    def set_image_counts
        count = Image.all.where(item_id: self.id).count
        self.update(image_count: count)
    end

    # SELECT COUNT(*) FROM "images" WHERE "images"."item_id" = $1  [["item_id", 1]]

    #----------------------------------------------------------------------
    # Class Method
    def self.set_image_counts
        Item.all.each{|item|
        count = Image.where(item_id: item.id).count
        item.update(image_count: count)
        }
    end

    #----------------------------------------------------------------------
    #3
    #----------------------------------------------------------------------
    # Instance Method
    def set_primary_image_ids
        my_imgs = Image.where(item_id: self.id)
        prim = my_imgs.where("file_name like?", "%_m%")
        num_1 = prim.map{|p|
        p.file_name.delete("^0-9").to_i
        }
        first = num_1.min
        fin = my_imgs.where("file_name like?", "%#{first}_m%")
        self.update(primary_image_id: fin.ids[0])
    end
   
# Image Load (1.1ms)  SELECT "images".* FROM "images" WHERE "images"."item_id" = $1 AND (file_name like'%_m%')  [["item_id", 1]]
#    (0.6ms)  SELECT "images"."id" FROM "images" WHERE (file_name like'%1_m%')
#    (0.2ms)  BEGIN
#   Item Update (0.7ms)  UPDATE "items" SET "primary_image_id" = $1, "updated_at" = $2 WHERE "items"."id" = $3
    
    #----------------------------------------------------------------------
    # Class Method
    def self.set_primary_image_ids
        Item.all.each{|item|
        my_imgs = Image.where(item_id: item.id)
        prim = my_imgs.where("file_name like?", "%_m%")
        num_1 = prim.map{|p|
        p.file_name.delete("^0-9").to_i
        }
        first = num_1.min
        fin = my_imgs.where("file_name like?", "%#{first}_m%")
        item.update(primary_image_id: fin.ids[0])
        }
    end

    #----------------------------------------------------------------------
    #4
    #----------------------------------------------------------------------

    def self.get_first_image_name(item)
		image = Image.where(item_id: item.id)
		image[0].file_name
	end

    #Image is an array so we can't call file name on the array so since the name of the function is get first image name I changed the method to return the name of the image at index 0. 

    #----------------------------------------------------------------------
    #BONUS
    #----------------------------------------------------------------------

    
    def self.ret_json_hash(item_id)
        item = Item.where(id: item_id)
        item.to_json
    end

    #----------------------------------------------------------------------
    # def new_count
    #     self.images.length
    # end

    # def get_all_img(it_name)
    #     self.images.where(item_id: self.id)
    # end

    # def get_all_img
    #     self.images.where(item_id: self.id)
    # end
end
