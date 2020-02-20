class TaxForm < ApplicationRecord

  FORM_W2       = "w2"
  FORM_W4       = "w4"
  FORM_1098_T   = "1098_t"
  FORM_1099_DIV = "1099_div"
  FORM_1099_G   = "1099_g"
  FORM_1099_INT = "1099_int"
  FORM_SCHEDULE_A = "schedule_a"

  FORM_TYPES = [FORM_W2, FORM_W4, FORM_1098_T, FORM_1099_DIV, FORM_1099_G, FORM_1099_INT, FORM_SCHEDULE_A]

  has_one_attached :document

  validates :tax_year,  presence: true, format: {with: /(19|20)\d{2}/, message: "Only years 1900-2099 are valid."}
  validates :form_name, presence: true, inclusion: {in: FORM_TYPES, message: "Has to be a valid tax form (e.g. 1099_int"}
  validates :document,  presence: true

  scope :for_year,  ->(year) { where(tax_year: year) }
  scope :form_type, ->(name) { where(form_name: name) }
end
