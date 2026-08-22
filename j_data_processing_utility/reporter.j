load 'j_data_processing_utility/validator.j'

REPORT_DATA=: 3 : 0
  'data;report_type' y
  validated_data=. VALIDATE_DATA data
  case. report_type do.
  'text': TEXT_REPORT validated_data
  'json': JSON_REPORT validated_data
  'default': 'Unsupported report type'
  end.
)

TEXT_REPORT=: 3 : 0
  data=. y
  data,. 0
)

JSON_REPORT=: 3 : 0
  data=. y
  '{
