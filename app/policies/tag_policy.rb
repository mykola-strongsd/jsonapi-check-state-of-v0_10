class TagPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      return scope unless user.access_none?

      scope.none
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    !@user.access_none?
  end

  def show?
    !@user.access_none?
  end

  def create?
    !@user.access_none?
  end

  def update?
    !@user.access_none?
  end

  def destroy?
    !@user.access_none?
  end
end
