class TaxFormController < ApplicationController

  def upload_form
    Rails.logger.debug("Here's the given params: #{tax_form_params}")
    @tax_form = TaxForm.new(tax_form_params)

    if @tax_form.save
      render json: @tax_form, status: :accepted
    else
      render json: @tax_form.errors, status: :not_acceptable
    end
  end

  private

    def tax_form_params
      params.require(:tax_form).permit(:form_name, :tax_year, :document)
    end
end
