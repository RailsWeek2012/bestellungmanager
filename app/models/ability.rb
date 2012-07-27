class Ability
  include CanCan::Ability


  def initialize(user)

        user ||=User.new
       if user.admin?
         can :manage, :all
       else

         can :laden,  Artikel
         can :index, User
         can :index,  Artikel
         can :index,  Bestellung
         can :index,  Gruppe

         can :show,  Artikel
         can :show,  Bestellung
         can :show,  Gruppe
         can :show,  User

         can :create, Artikel
         can :create, Bestellung
         can :create, Gruppe
         can :create, User

         can :new,   Artikel
         can :new,    Bestellung
         can :new,   Gruppe
         can :new,   User

         can :edit, User.where("id=?",user.id)
         can :edit, Artikel.where("user_id=?",user.id)
         can :edit, Gruppe.where("user_id=?",user.id)
         can :edit, Bestellung.where("user_id=?",user.id)

         can :update, Artikel.where("user_id=?",user.id)
         can :update, User.where("id=?",user.id)
         can :update, Gruppe.where("user_id=?",user.id)
         can :update, Bestellung.where("user_id=?",user.id)

         can :destroy, Artikel.where("user_id=?",user.id)
         can :destroy, Gruppe.where("user_id=?",user.id)
         can :destroy, Bestellung.where("user_id=?",user.id)
         can :destroy, User.where("id=?",user.id)



       end

  end
end
