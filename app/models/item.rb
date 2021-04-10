class Item < ApplicationRecord
    has_many :images

    def self.set_image_counts
        Item.all.each{|item|
        count = Image.where(item_id: item.id).count
        item.update(image_count: count)
        }
    end

    def new_count
        self.images.length
    end

    def get_all_img(it_name)
        self.images.where(item_id: self.id)
    end

    # def get_all_img
    #     self.images.where(item_id: self.id)
    # end


    
end
