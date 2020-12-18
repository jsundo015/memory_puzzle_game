require "byebug"

class Card
    attr_accessor :face_value

    def initialize(val)
        @face_value = val
        @up = false
    end

    def up?
        return @up
    end

    def reveal
        @up = true
        return self.face_value
    end

    def isSame?(otherCard)
        if self.face_value == otherCard.face_value
            return true
        else
            return false
        end
    end

    def hide
        @up = false
    end

end
