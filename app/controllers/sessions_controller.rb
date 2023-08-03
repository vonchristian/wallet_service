class SessionsController < ApplicationController
    def new
        redirect_to current_person if logged_in?
    end

    def create
      @person = Person.find_by(email: params[:email])
      if @person && @person.authenticate(params[:password])
        session[:person_id] = @person.id
        respond_to do |format|
          format.html { redirect_to @person, notice: "signed in successfully" }
        end
      else
        respond_to do |format|
          format.html do
            flash.now[:alert] = "Invalid email or password"
            render :new, status: :unprocessable_entity
          end
        end
      end
    end

    def destroy
        session[:person_id] = nil
        redirect_to login_path
    end
  end