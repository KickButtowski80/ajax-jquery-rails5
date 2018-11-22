class Task < ApplicationRecord
    
    def self.in_complete
        where(complete: false)
    end
    
    def self.complete
        where(complete: true)
    end
end
