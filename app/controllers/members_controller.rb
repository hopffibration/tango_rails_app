class MembersController < ApplicationController
  def index
    if params[:query].present?
      @member = Member.search(params[:query], page: params[:page])
    else
      @member = Member.all
    end
  end
  
  def new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def show
    @member = Member.find(params[:id])
  end
  
  def create
    @member = Member.new(member_params)
    @member.save
    redirect_to @member
  end

  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      redirect_to @member
    else
      render 'edit'
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to members_path
  end

  private
  def member_params
    params.require(:member).permit(:first_name,:last_name,:email,:status)
  end
  
end
