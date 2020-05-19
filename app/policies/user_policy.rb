class UserPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      return scope if user.access_full?

      return scope.where(id: user.id) if user.access_own?

      scope.none
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    !user.access_none?
  end

  def show?
    user.access_full? || (user.access_own? && record.id == user.id)
  end

  def create?
    @user.access_full?
  end

  def update?
    user.access_full? || (user.access_own? && record.id == user.id)
  end

  def destroy?
    user.access_full? || (user.access_own? && record.id == user.id)
  end
end
