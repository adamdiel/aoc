class ScratchGame
    attr_accessor :card_num, :nums, :winners

    def initialize(card_num, nums, winners)
        @card_num = card_num
        @nums = nums
        @winners = winners
    end

    def to_s
        @card_num.to_s
    end
end