ActiveAdmin.register Score do
  permit_params \
    :user_id,
    :exercise_id,
    :score,
    :discipline

  # TODO discipline as select, user email in user select
end
