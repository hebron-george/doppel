class TaxFormController < ApplicationController

  def upload_form
    @tax_form = TaxForm.new(tax_form_params)

    if @tax_form.save
      response = {
        id:        @tax_form.id,
        tax_year:  @tax_form.tax_year,
        form_name: @tax_form.form_name,
        url:       url_for(@tax_form.document),
      }
      render json: response, status: :accepted
    else
      render json: @tax_form.errors, status: :not_acceptable
    end
  end

  private

    def tax_form_params
      params.require(:tax_form).permit(:form_name, :tax_year, :document)
    end
end
