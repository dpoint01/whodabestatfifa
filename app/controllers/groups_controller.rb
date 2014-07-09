class GroupsController < ApplicationController
  def index
    @groups = Group.all.order("name ASC")
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    #@group.user_id = current_user.id

    if @group.save
      Membership.create(group: @group,user: current_user )
      redirect_to @group, notice: "Group was successfully created."
    else
      render :new, notice: "Your group couldnt be saved."
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :location)
  end
end
