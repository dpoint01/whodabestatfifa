class GroupsController < ApplicationController
  def index
    @current_user_memberships = Membership.where("user_id = #{current_user.id}")

    @groups = Group.all.order("name ASC")

    @user_groups_id = Array.new

    @current_user_memberships.each do |membership|
      @user_groups_id << membership.group_id
    end

    @groups_joined = Group.find_all_by_id(@user_groups_id)
    @groups_not_joined = Group.find_all_by_id(!@user_groups_id)

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
