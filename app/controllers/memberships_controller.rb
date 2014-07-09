class MembershipsController < ApplicationController
  def create
    @joined = false
    membership = Membership.create(group_id: params[:group_id], user: current_user)

    if membership.save
      @joined = true
      redirect_to group_path(params[:group_id])
    else
      render :new, notice: "Your group couldnt be saved."
    end
  end
end
