class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update, :destroy]

    def index
        @profiles = Profile.all
    end

    def new
        @profile = Profile.new
    end

    def show
        @profile = Profile.find(params[:id])
    end

    def create
        # Creating an empty instance and fill it with details
        @profile = Profile.new(profile_params)
        @profile.user = current_user
        
        # Sending back a response from the person who used to the form
        respond_to do |format|

            # Save profile (hopefully)
            if @profile.save
                format.html { redirect_to @profile, notice: 'Profile was successfully created!' }
            else
                format.html { render :new }
            end
        end

        
    end

    def edit
        @profile = Profile.find(params[:id])
    end

    def update
        @profile = Profile.find(params[:id])

        respond_to do |format|
            if @profile.update(profile_params)
                format.html { redirect_to @profile, notice: 'Profile was successfully updated!' }
            else
                format.html { render :edit }
            end
        end
    end

    def destroy
        @profile = Profile.find(params[:id])
        
        @profile.destroy
        respond_to do |format|
            format.html { redirect_to profiles_url, notice: 'Profile was successfully deleted!' }
        end
    end

private
    def profile_params
        params.require(:profile).permit(:avatar, :first_name, :last_name, :country)
    end

    def set_profile
        @profile = Profile.find(params[:id])
    end
end