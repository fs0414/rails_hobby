module FormModule
  extend ActiveSupport::Concern
  include ActiveModel::Model

  module ClassMethods
    def run(**args)
      new(**args).tap { |form| form.run }
    end
  end

  def run
    raise NotImplementError
  end
end
