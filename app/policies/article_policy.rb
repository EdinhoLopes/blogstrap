class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
     def resolve
       scope.all
     end
  end

  def show?
    true
  end

  def create?
    user&.id
  end

  #Se o id do usuário logado for igual ao id do usuário que criou o registro, retorna verdadeiro.
  def update?
    user&.id == record.user.id
  end

  #Se o id do usuário logado for igual ao id do usuário que criou o registro, retorna verdadeiro.
  def destroy?
    user&.id == record.user.id
  end
end
