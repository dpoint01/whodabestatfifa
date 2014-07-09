class MembershipsController < ApplicationController
  def create

    membership = Membership.create(group_id: params[:group_id], user: current_user)
    redirect_to group_path(params[:group_id])

  end
end
