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
         can :index,  Auftrag
         can :index,  Bestellung

         can :show,  Artikel
         can :show,  Auftrag
         can :show,  Bestellung
         can :show,  User.where("id=?",user.id)

         can :create, Artikel
         can :create, Auftrag
         can :create, Bestellung
         can :create, User

         can :new,   Artikel
         can :new,    Auftrag
         can :new,   Bestellung
         can :new,   User

         can :edit, User.where("id=?",user.id)
         can :edit, Artikel.where("user_id=?",user.id)
         can :edit, Bestellung.where("user_id=?",user.id)
         can :edit, Auftrag.where("user_id=?",user.id)

         can :update, Artikel.where("user_id=?",user.id)
         can :update, User.where("id=?",user.id)
         can :update, Bestellung.where("user_id=?",user.id)
         can :update, Auftrag.where("user_id=?",user.id)

         can :destroy, Artikel.where("user_id=?",user.id)
         can :destroy, Bestellung.where("user_id=?",user.id)
         can :destroy, Auftrag.where("user_id=?",user.id)
         can :destroy, User.where("id=?",user.id)



       end

  end
end
