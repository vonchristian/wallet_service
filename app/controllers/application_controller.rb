class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_person

    private

    def current_person
        if session[:person_id]
          @current_person = Person.find(session[:person_id])
        end
    end

    def logged_in?
        !!current_person
    end

    def authenticated
        redirect_to login_path unless logged_in?
      end
end
