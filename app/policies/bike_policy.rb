class BikePolicy < ApplicationPolicy

  def permitted_attributes
    if user.admin? || user.owner_of?(bike)
      [:kind, :size, :address, :brand, :price]
    else
      [:tag_list]
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def update?
    record.user == user
  end

  def create?
    if user.nil?
      redirect_to new_user_registration_path
    else
      true
    end
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
