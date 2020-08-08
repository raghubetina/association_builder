class Associations::StepsController < ApplicationController
  include Wicked::Wizard

  steps *Association.form_steps

  def show
    @association = Association.find(params[:association_id])
    render_wizard
  end

  def update
    @association = Association.find(params[:association_id])
    @association.update(association_params(step))

    if step == "nature" && @association.indirect?
      jump_to(:through)
      render_wizard
    elsif step == "foreign_key" && @association.valid?
      jump_to(:name)
      render_wizard
    else
      render_wizard @association
    end
  end
  
  def finish_wizard_path
    association_path(@association)
  end

  private

  def association_params(step)
  	permitted_attributes = case step
      when "origin_model"
        [:origin_model_id]
      when "terminus_model"
        [:origin_model_id, :terminus_model_id]
      when "nature"
        [:origin_model_id, :terminus_model_id, :nature]
      when "foreign_key"
        [:origin_model_id, :terminus_model_id, :nature, :foreign_key]
      when "through"
        [:origin_model_id, :terminus_model_id, :nature, :through_association_id]
      when "source"
        [:origin_model_id, :terminus_model_id, :nature, :through_association_id, :source_association_id]
      when "name"
        [:origin_model_id, :terminus_model_id, :nature, :foreign_key, :through_association_id, :source_association_id, :name]
      end

  	params.require(:association).permit(permitted_attributes).merge(form_step: step)
  end
end
