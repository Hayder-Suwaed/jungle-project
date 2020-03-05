class Admin::SalesController < applicationController

    def index
        @sales = Sales.all
    end
end