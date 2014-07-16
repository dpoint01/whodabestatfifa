class GroupsController < ApplicationController
  def index
    @search = false
    @groups = Group.all

    if params[:search]
      @search = true
      @groups_searched = Group.search(params[:search])

      if !@groups_searched.empty?
        flash.now[:notice] = "Found some stuff!"
      elsif @groups_searched.empty?
         flash.now[:alert] = "No results for '#{params[:search]}' "
      end
    end

  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users.order(:position)
    @opponents = @users.reject{|i| i.id == current_user.id}
    @game = Game.new
    @games = Game.all.order("created_at DESC")
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
