class UserPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      return scope if user.access_full?

      scope.none
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.access_full?
  end

  def show?
    @user.access_full?
  end

  def create?
    @user.access_full?
  end

  def update?
    @user.access_full?
  end

  def destroy?
    @user.access_full?
  end
end
