class PersonsController < ApplicationController
    before_action :authenticated
    def show
        @person = current_person
    end
end