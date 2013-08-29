class User < ActiveRecord::Base
  has_many :skills
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   # Setup accessible (or protected) attributes for your model
   attr_accessible :first_name, :last_name, :part_type, :school_company, 
                   :twitter, :email, :password, :password_confirmation, 
                   :current_password, :remember_me, :phone, :bio, :avatar, 
                   :crop_x, :crop_y, :crop_w, :crop_h
   has_attached_file :avatar, :styles => { 
       :thumb => {:geometry => "200x200#", :processors => [:cropper]}, 
       :large => {:geometry => "500x500>"} 
   }, :default_url => "/images/:style/missing.png"
   attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
   validates_presence_of :avatar, :first_name, :last_name


   def cropping?
     !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
   end

   def avatar_geometry(style = :original)
     @geometry ||= {}
     @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
   end

   private  
  
  
end
